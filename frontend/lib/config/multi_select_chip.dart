import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> options;
  final List<String>? initialSelected;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectChip({
    Key? key,
    required this.options,
    this.initialSelected,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  late List<String> _selectedChoices;

  @override
  void initState() {
    super.initState();
    _selectedChoices = widget.initialSelected != null
        ? List.from(widget.initialSelected!)
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: widget.options.map((item) {
        final bool isSelected = _selectedChoices.contains(item);
        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedChoices.add(item);
              } else {
                _selectedChoices.remove(item);
              }
              widget.onSelectionChanged(_selectedChoices);
            });
          },
          selectedColor: const Color(0xFFF77D8E),
          backgroundColor: Colors.grey[200],
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }).toList(),
    );
  }
}
