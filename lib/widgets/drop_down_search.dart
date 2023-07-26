
import 'package:flutter/material.dart';
class SearchableDropdownFormField extends StatefulWidget {
  final String labelText;
  final List<String> options;
  final Function(String) onChanged;

  SearchableDropdownFormField({
    required this.labelText,
    required this.options,
    required this.onChanged,
  });

  @override
  _SearchableDropdownFormFieldState createState() =>
      _SearchableDropdownFormFieldState();
}

class _SearchableDropdownFormFieldState
    extends State<SearchableDropdownFormField> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: widget.labelText,
      ),
      value: _selectedOption,
      onChanged: (newValue) {
        setState(() {
          _selectedOption = newValue;
        });
        widget.onChanged(newValue!);
      },
      items: widget.options
          .where((option) =>
          option.toLowerCase().contains(_searchController.text.toLowerCase()))
          .map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}