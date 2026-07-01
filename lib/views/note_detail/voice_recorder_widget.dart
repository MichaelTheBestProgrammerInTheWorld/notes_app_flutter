import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class VoiceRecorderWidget extends StatefulWidget {
  final Function(String path, String name) onStop;

  const VoiceRecorderWidget({super.key, required this.onStop});

  @override
  State<VoiceRecorderWidget> createState() => _VoiceRecorderWidgetState();
}

class _VoiceRecorderWidgetState extends State<VoiceRecorderWidget> {
  final _audioRecorder = AudioRecorder();
  bool _isRecording = false;

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        final dir = await getApplicationDocumentsDirectory();
        final path = p.join(dir.path, 'voice_\${DateTime.now().millisecondsSinceEpoch}.m4a');

        const config = RecordConfig();
        await _audioRecorder.start(config, path: path);

        setState(() {
          _isRecording = true;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _stop() async {
    final path = await _audioRecorder.stop();
    setState(() {
      _isRecording = false;
    });
    if (path != null) {
      widget.onStop(path, p.basename(path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isRecording ? Icons.stop : Icons.mic),
      color: _isRecording ? Colors.red : null,
      onPressed: _isRecording ? _stop : _start,
    );
  }
}
