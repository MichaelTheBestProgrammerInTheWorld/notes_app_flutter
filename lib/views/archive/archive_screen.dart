import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_flutter/core/design_system/widgets/widgets.dart';
import 'package:notes_app_flutter/core/l10n/strings.g.dart';
import 'package:notes_app_flutter/view_models/notes_view_model.dart';
import 'package:notes_app_flutter/views/note_detail/note_editor_screen.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesState = ref.watch(notesViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.archive.title),
      ),
      body: notesState.when(
        data: (notes) {
          final archived = notes.where((n) => n.isArchived).toList();
          if (archived.isEmpty) {
            return Center(child: Text(t.archive.no_archived));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: archived.length,
            itemBuilder: (context, index) {
              final note = archived[index];
              return NoteCard(
                title: note.title,
                snippet: note.content,
                date: note.updatedAt,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NoteEditorScreen(note: note)),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: \$err')),
      ),
    );
  }
}
