import 'package:drift/drift.dart';
import 'package:notes_app_flutter/data/database/app_database.dart';
import 'package:notes_app_flutter/domain/entities/attachment.dart' as entity;
import 'package:notes_app_flutter/domain/entities/note.dart' as entity;
import 'package:notes_app_flutter/domain/repositories/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository {
  final AppDatabase _db;

  NotesRepositoryImpl(this._db);

  @override
  Future<List<entity.Note>> getAllNotes() async {
    final notes = await _db.select(_db.notes).get();
    return Future.wait(notes.map(_mapToEntity));
  }

  @override
  Stream<List<entity.Note>> watchAllNotes() {
    return _db.select(_db.notes).watch().asyncMap((notes) => Future.wait(notes.map(_mapToEntity)));
  }

  @override
  Future<entity.Note?> getNoteById(int id) async {
    final query = _db.select(_db.notes)..where((t) => t.id.equals(id));
    final note = await query.getSingleOrNull();
    if (note == null) return null;
    return _mapToEntity(note);
  }

  @override
  Future<int> insertNote(entity.Note note) async {
    return await _db.transaction(() async {
      final noteId = await _db.into(_db.notes).insert(
            NotesCompanion.insert(
              title: note.title,
              content: note.content,
              createdAt: Value(note.createdAt),
              updatedAt: Value(note.updatedAt),
              isPinned: Value(note.isPinned),
              isArchived: Value(note.isArchived),
              orderIndex: Value(note.orderIndex),
            ),
          );

      for (var attachment in note.attachments) {
        await _db.into(_db.attachments).insert(
              AttachmentsCompanion.insert(
                noteId: noteId,
                type: attachment.type,
                path: attachment.path,
                name: attachment.name,
              ),
            );
      }
      return noteId;
    });
  }

  @override
  Future<void> updateNote(entity.Note note) async {
    await _db.transaction(() async {
      await (_db.update(_db.notes)..where((t) => t.id.equals(note.id!))).write(
            NotesCompanion(
              title: Value(note.title),
              content: Value(note.content),
              updatedAt: Value(DateTime.now()),
              isPinned: Value(note.isPinned),
              isArchived: Value(note.isArchived),
              orderIndex: Value(note.orderIndex),
            ),
          );

      // Simple sync for attachments: delete all and re-insert
      await (_db.delete(_db.attachments)..where((t) => t.noteId.equals(note.id!))).go();
      for (var attachment in note.attachments) {
        await _db.into(_db.attachments).insert(
              AttachmentsCompanion.insert(
                noteId: note.id!,
                type: attachment.type,
                path: attachment.path,
                name: attachment.name,
              ),
            );
      }
    });
  }

  @override
  Future<void> deleteNote(int id) async {
    await (_db.delete(_db.notes)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> deleteAllNotes() async {
    await _db.delete(_db.notes).go();
  }

  @override
  Future<List<entity.Note>> searchNotes(String query) async {
    final lowercaseQuery = '%\${query.toLowerCase()}%';
    
    // Search in title, content, and attachment names
    final notesQuery = _db.select(_db.notes).join([
      leftOuterJoin(_db.attachments, _db.attachments.noteId.equalsExp(_db.notes.id)),
    ])
      ..where(
        _db.notes.title.lower().like(lowercaseQuery) |
        _db.notes.content.lower().like(lowercaseQuery) |
        _db.attachments.name.lower().like(lowercaseQuery) |
        _db.notes.id.cast<String>().like(lowercaseQuery), // Searching by index/id
      );

    final results = await notesQuery.get();
    
    // De-duplicate results as a note can have multiple attachments matching the search
    final noteIds = <int>{};
    final distinctNotes = <Note>[];
    for (var row in results) {
      final note = row.readTable(_db.notes);
      if (noteIds.add(note.id)) {
        distinctNotes.add(note);
      }
    }

    return Future.wait(distinctNotes.map(_mapToEntity));
  }

  Future<entity.Note> _mapToEntity(Note note) async {
    final attachmentsQuery = _db.select(_db.attachments)..where((t) => t.noteId.equals(note.id));
    final attachments = await attachmentsQuery.get();

    return entity.Note(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
      isPinned: note.isPinned,
      isArchived: note.isArchived,
      orderIndex: note.orderIndex,
      attachments: attachments
          .map((a) => entity.Attachment(
                id: a.id,
                noteId: a.noteId,
                type: a.type,
                path: a.path,
                name: a.name,
              ))
          .toList(),
    );
  }
}
