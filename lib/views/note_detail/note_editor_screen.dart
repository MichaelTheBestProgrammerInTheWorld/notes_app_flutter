import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_flutter/core/l10n/strings.g.dart';
import 'package:notes_app_flutter/core/utils/multimedia_helper.dart';
import 'package:notes_app_flutter/domain/entities/attachment.dart';
import 'package:notes_app_flutter/domain/entities/note.dart';
import 'package:notes_app_flutter/view_models/notes_view_model.dart';
import 'package:notes_app_flutter/views/note_detail/voice_recorder_widget.dart';

class NoteEditorScreen extends ConsumerStatefulWidget {
  final Note? note;

  const NoteEditorScreen({super.key, this.note});

  @override
  ConsumerState<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends ConsumerState<NoteEditorScreen> {
  late QuillController _controller;
  late TextEditingController _titleController;
  final FocusNode _focusNode = FocusNode();
  List<Attachment> _attachments = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _attachments = widget.note?.attachments.toList() ?? [];
    
    if (widget.note != null && widget.note!.content.isNotEmpty) {
      final doc = Document.fromJson(jsonDecode(widget.note!.content));
      _controller = QuillController(
        document: doc,
        selection: const TextSelection.collapsed(offset: 0),
      );
    } else {
      _controller = QuillController.basic();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    final title = _titleController.text.trim();
    final content = jsonEncode(_controller.document.toDelta().toJson());

    if (title.isEmpty && _controller.document.isEmpty()) return;

    final now = DateTime.now();
    final note = widget.note?.copyWith(
          title: title,
          content: content,
          updatedAt: now,
          attachments: _attachments,
        ) ??
        Note(
          title: title,
          content: content,
          createdAt: now,
          updatedAt: now,
          attachments: _attachments,
        );

    if (widget.note == null) {
      await ref.read(notesViewModelProvider.notifier).addNote(note);
    } else {
      await ref.read(notesViewModelProvider.notifier).updateNote(note);
    }

    if (mounted) Navigator.of(context).pop();
  }

  void _addAttachments(List<Attachment> newAttachments) {
    setState(() {
      _attachments.addAll(newAttachments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? t.note_editor.new_title : t.note_editor.edit_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: t.note_editor.title_hint,
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          QuillSimpleToolbar(
            controller: _controller,
            config: const QuillSimpleToolbarConfig(),
          ),
          if (_attachments.isNotEmpty) _buildAttachmentList(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuillEditor.basic(
                controller: _controller,
                config: const QuillEditorConfig(),
              ),
            ),
          ),
          _buildMultimediaToolbar(),
        ],
      ),
    );
  }

  Widget _buildAttachmentList() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _attachments.length,
        itemBuilder: (context, index) {
          final att = _attachments[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    att.type == 'image' ? Icons.image : 
                    att.type == 'video' ? Icons.videocam :
                    att.type == 'audio' ? Icons.mic : Icons.attach_file,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    onPressed: () {
                      setState(() {
                        _attachments.removeAt(index);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMultimediaToolbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border(top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () async {
              final newAtts = await MultimediaHelper.pickImages(context);
              _addAttachments(newAtts);
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () async {
              final newAtt = await MultimediaHelper.pickVideo(context);
              if (newAtt != null) _addAttachments([newAtt]);
            },
          ),
          VoiceRecorderWidget(
            onStop: (path, name) {
              _addAttachments([Attachment(type: 'audio', path: path, name: name)]);
            },
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () async {
              final newAtt = await MultimediaHelper.pickFile();
              if (newAtt != null) _addAttachments([newAtt]);
            },
          ),
        ],
      ),
    );
  }
}
