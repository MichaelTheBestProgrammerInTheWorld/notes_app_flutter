import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app_flutter/core/di/injection.dart';
import 'package:notes_app_flutter/domain/entities/note.dart';
import 'package:notes_app_flutter/domain/repositories/notes_repository.dart';
import 'package:notes_app_flutter/view_models/notes_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notes_view_model_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {
  late MockNotesRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockNotesRepository();
    
    // Register the mock repository in GetIt
    getIt.reset();
    getIt.registerSingleton<NotesRepository>(mockRepository);

    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('Initial state fetches notes from repository', () async {
    final notes = [
      Note(id: 1, title: 'Test 1', content: '{}', createdAt: DateTime.now(), updatedAt: DateTime.now()),
    ];

    when(mockRepository.getAllNotes()).thenAnswer((_) async => notes);

    final viewModel = container.read(notesViewModelProvider.notifier);
    final state = await container.read(notesViewModelProvider.future);

    expect(state, notes);
    verify(mockRepository.getAllNotes()).called(1);
  });

  test('Add note calls repository and refreshes state', () async {
    final note = Note(title: 'New Note', content: '{}', createdAt: DateTime.now(), updatedAt: DateTime.now());
    
    when(mockRepository.getAllNotes()).thenAnswer((_) async => []);
    when(mockRepository.insertNote(note)).thenAnswer((_) async => 1);

    final viewModel = container.read(notesViewModelProvider.notifier);
    await viewModel.addNote(note);

    verify(mockRepository.insertNote(note)).called(1);
    verify(mockRepository.getAllNotes()).called(2); // Initial build + Refresh
  });
}
