// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotesViewModel)
final notesViewModelProvider = NotesViewModelProvider._();

final class NotesViewModelProvider
    extends $AsyncNotifierProvider<NotesViewModel, List<Note>> {
  NotesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notesViewModelHash();

  @$internal
  @override
  NotesViewModel create() => NotesViewModel();
}

String _$notesViewModelHash() => r'ab15992077dea5314ccd0338474dfb915389e0d3';

abstract class _$NotesViewModel extends $AsyncNotifier<List<Note>> {
  FutureOr<List<Note>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Note>>, List<Note>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Note>>, List<Note>>,
              AsyncValue<List<Note>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
