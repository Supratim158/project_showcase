import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class VideoUploadBox extends StatefulWidget {
  final String label;
  final Function(String? filePath) onVideoPicked;

  const VideoUploadBox({
    Key? key,
    required this.label,
    required this.onVideoPicked,
  }) : super(key: key);

  @override
  State<VideoUploadBox> createState() => _VideoUploadBoxState();
}

class _VideoUploadBoxState extends State<VideoUploadBox> {
  String? _fileName;

  Future<void> _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _fileName = result.files.first.name;
      });
      widget.onVideoPicked(result.files.first.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickVideo,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey[400]!),
        ),
        child: Row(
          children: [
            Icon(Icons.play_circle_fill, color: Colors.blue, size: 36),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                _fileName ?? 'Upload ${widget.label}',
                style: TextStyle(
                  color: _fileName == null ? Colors.black45 : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
