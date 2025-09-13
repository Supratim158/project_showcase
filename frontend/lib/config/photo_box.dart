import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoBox extends StatefulWidget {
  final int boxCount;
  final Function(List<XFile?>, List<String>) onChanged;

  const PhotoBox({
    Key? key,
    this.boxCount = 4,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PhotoBoxState createState() => _PhotoBoxState();
}

class _PhotoBoxState extends State<PhotoBox> {
  final ImagePicker _picker = ImagePicker();
  late List<XFile?> _images;
  late List<TextEditingController> _nameControllers;

  @override
  void initState() {
    super.initState();
    _images = List<XFile?>.filled(widget.boxCount, null);
    _nameControllers = List.generate(widget.boxCount, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _nameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickImage(int index) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _images[index] = picked;
      });
      widget.onChanged(_images, _nameControllers.map((c) => c.text).toList());
    }
  }

  Widget _buildBox(int index) {
    final bool isMandatory = index == 0;
    final image = _images[index];
    return Column(
      children: [
        GestureDetector(
          onTap: () => _pickImage(index),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
              image: image != null
                  ? DecorationImage(
                image: FileImage(File(image.path)),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: image == null
                ? Center(
              child: Icon(
                Icons.add,
                size: 40,
                color: isMandatory ? Colors.red : Colors.black54,
              ),
            )
                : null,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: TextField(
            controller: _nameControllers[index],
            decoration: InputDecoration(
              hintText: 'Name',
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (isMandatory && image == null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'Required',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }

  bool isFirstPhotoSelected() {
    return _images[0] != null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(widget.boxCount, (index) => _buildBox(index)),
        ),
      ],
    );
  }
}
