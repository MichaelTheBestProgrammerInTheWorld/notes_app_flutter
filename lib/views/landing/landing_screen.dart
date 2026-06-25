import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_flutter/core/design_system/widgets/widgets.dart';
import 'package:notes_app_flutter/core/l10n/strings.g.dart';
import 'package:notes_app_flutter/view_models/notes_view_model.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesState = ref.watch(notesViewModelProvider);
    final isTablet = MediaQuery.sizeOf(context).width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.landing.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.archive),
            onPressed: () {
              // Navigate to Archive
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              _showDeleteAllDialog(context, ref);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              hintText: t.landing.search_hint,
              leading: const Icon(Icons.search),
              onChanged: (value) {
                ref.read(notesViewModelProvider.notifier).search(value);
              },
            ),
          ),
          Expanded(
            child: notesState.when(
              data: (notes) {
                if (notes.isEmpty) {
                  return Center(child: Text(t.landing.no_notes));
                }

                final pinned = notes.where((n) => n.isPinned && !n.isArchived).toList();
                final others = notes.where((n) => !n.isPinned && !n.isArchived).toList();

                return CustomScrollView(
                  slivers: [
                    if (pinned.isNotEmpty) ...[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Text(t.landing.pinned, style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        sliver: _buildNotesGrid(pinned, isTablet, ref, isPinned: true),
                      ),
                    ],
                    if (others.isNotEmpty) ...[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Text(t.landing.others, style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        sliver: _buildNotesGrid(others, isTablet, ref, isPinned: false),
                      ),
                    ],
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: \$err')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // Navigate to Note Editor
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNotesGrid(List<dynamic> notes, bool isTablet, WidgetRef ref, {required bool isPinned}) {
    if (isPinned) {
      // Pinned notes are NOT reorderable as per requirements
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTablet ? 3 : 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final note = notes[index];
            return NoteCard(
              title: note.title,
              snippet: note.content, // Should be truncated
              date: note.updatedAt,
              isPinned: note.isPinned,
              onTap: () {
                // Edit note
              },
              onLongPress: () {
                // Multi-select or Pin/Unpin
              },
            );
          },
          childCount: notes.length,
        ),
      );
    } else {
      // Others are reorderable
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final note = notes[index];
            return Dismissible(
              key: Key(note.id.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Theme.of(context).colorScheme.error,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                bool? result;
                await showDialog(
                  context: context,
                  builder: (context) => ConfirmationDialog(
                    title: t.common.confirm_delete_title,
                    message: t.common.confirm_delete_message,
                    confirmLabel: t.common.delete,
                    isDestructive: true,
                    onConfirm: () {
                      result = true;
                    },
                  ),
                );
                if (result == true) {
                  ref.read(notesViewModelProvider.notifier).deleteNote(note.id!);
                }
                return result;
              },
              child: NoteCard(
                title: note.title,
                snippet: note.content,
                date: note.updatedAt,
                isPinned: note.isPinned,
                onTap: () {
                  // Edit note
                },
              ),
            );
          },
          childCount: notes.length,
        ),
      );
    }
  }

  void _showDeleteAllDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: t.common.confirm_delete_all_title,
        message: t.common.confirm_delete_all_message,
        confirmLabel: t.common.delete,
        isDestructive: true,
        onConfirm: () {
          // Repository delete all logic
        },
      ),
    );
  }
}
