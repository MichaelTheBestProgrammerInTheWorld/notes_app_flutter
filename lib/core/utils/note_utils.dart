import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart';

class NoteUtils {
  static String getSnippet(String contentJson) {
    if (contentJson.isEmpty) return '';
    try {
      final delta = Document.fromJson(jsonDecode(contentJson)).toDelta();
      String plainText = delta.toPlainText();
      if (plainText.length > 100) {
        return '\${plainText.substring(0, 100)}...';
      }
      return plainText.trim();
    } catch (e) {
      return '';
    }
  }
}
