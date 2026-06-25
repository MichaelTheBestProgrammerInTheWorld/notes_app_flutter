class Attachment {
  final int? id;
  final int? noteId;
  final String type;
  final String path;
  final String name;

  Attachment({
    this.id,
    this.noteId,
    required this.type,
    required this.path,
    required this.name,
  });
}
