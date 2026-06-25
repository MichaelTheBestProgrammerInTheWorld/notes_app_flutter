import 'package:notes_app_flutter/core/di/injection.dart';
import 'package:notes_app_flutter/domain/entities/note.dart';
import 'package:notes_app_flutter/domain/repositories/notes_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes_view_model.g.dart';

@riverpod
class NotesViewModel extends _$NotesViewModel {
  late final NotesRepository _repository;

  @override
  FutureOr<List<Note>> build() async {
    _repository = getIt<NotesRepository>();
    return _repository.getAllNotes();
  }

  Future<void> refreshNotes() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.getAllNotes());
  }

  Future<void> addNote(Note note) async {
    await _repository.insertNote(note);
    await refreshNotes();
  }

  Future<void> updateNote(Note note) async {
    await _repository.updateNote(note);
    await refreshNotes();
  }

  Future<void> deleteNote(int id) async {
    await _repository.deleteNote(id);
    await refreshNotes();
  }

  Future<void> togglePin(Note note) async {
    final pinnedCount = state.value?.where((n) => n.isPinned).length ?? 0;
    if (!note.isPinned && pinnedCount >= 5) {
      // Limit reached, maybe throw error or handle in UI
      return;
    }
    await _repository.updateNote(note.copyWith(isPinned: !note.isPinned));
    await refreshNotes();
  }

  Future<void> toggleArchive(Note note) async {
    await _repository.updateNote(note.copyWith(isArchived: !note.isArchived));
    await refreshNotes();
  }

  Future<void> reorderNotes(int oldIndex, int newIndex) async {
    final notes = state.value;
    if (notes == null) return;

    // Separate pinned and unpinned
    final pinned = notes.where((n) => n.isPinned).toList();
    final unpinned = notes.where((n) => !n.isPinned).toList();

    if (newIndex > oldIndex) newIndex--;
    
    final item = unpinned.removeAt(oldIndex);
    unpinned.insert(newIndex, item);

    // Update orderIndex for all unpinned
    for (int i = 0; i < unpinned.length; i++) {
      await _repository.updateNote(unpinned[i].copyWith(orderIndex: i));
    }
    await refreshNotes();
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      await refreshNotes();
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.searchNotes(query));
  }
}
