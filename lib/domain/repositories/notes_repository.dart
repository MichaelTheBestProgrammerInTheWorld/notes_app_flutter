import '../entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getAllNotes();
  Stream<List<Note>> watchAllNotes();
  Future<Note?> getNoteById(int id);
  Future<int> insertNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(int id);
  Future<void> deleteAllNotes();
  Future<List<Note>> searchNotes(String query);
}
