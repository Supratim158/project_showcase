import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String labelText; // Label for the field
  final String hintText; // Hint text inside the field
  final String errorMessage; // Validation message
  final TextEditingController controller; // Controller
  final TextInputType keyboardType; // Keyboard type
  final int? maxLines; // For multi-line fields
  final int? minLines; // For multi-line fields
  final List<TextInputFormatter>? inputFormatters; // New: input formatters

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.errorMessage,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.minLines,
    this.inputFormatters, // Add to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 3),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters, // Apply them here
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMessage;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black26),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
            ),
            minLines: minLines,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
