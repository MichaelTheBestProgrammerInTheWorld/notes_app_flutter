import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:notes_app_flutter/domain/entities/attachment.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:path/path.dart' as p;

class MultimediaHelper {
  static Future<List<Attachment>> pickImages(BuildContext context, {int max = 5}) async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: max,
        requestType: RequestType.image,
      ),
    );

    if (result == null) return [];

    List<Attachment> attachments = [];
    for (var entity in result) {
      final file = await entity.file;
      if (file != null) {
        final savedFile = await _saveFileToAppDir(file);
        attachments.add(Attachment(
          type: 'image',
          path: savedFile.path,
          name: entity.title ?? 'image',
        ));
      }
    }
    return attachments;
  }

  static Future<Attachment?> pickVideo(BuildContext context) async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        maxAssets: 1,
        requestType: RequestType.video,
      ),
    );

    if (result == null || result.isEmpty) return null;

    final file = await result.first.file;
    if (file != null) {
      final savedFile = await _saveFileToAppDir(file);
      return Attachment(
        type: 'video',
        path: savedFile.path,
        name: result.first.title ?? 'video',
      );
    }
    return null;
  }

  static Future<Attachment?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt', 'pdf', 'doc'],
    );

    if (result == null || result.files.isEmpty) return null;

    final file = File(result.files.first.path!);
    final savedFile = await _saveFileToAppDir(file);
    return Attachment(
      type: 'file',
      path: savedFile.path,
      name: result.files.first.name,
    );
  }

  static Future<File> _saveFileToAppDir(File file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = p.basename(file.path);
    return file.copy(p.join(appDir.path, fileName));
  }
}
