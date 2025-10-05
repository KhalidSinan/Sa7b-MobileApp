import 'package:flutter/material.dart';

class DropdownItem {
  final int id;
  final String name;

  DropdownItem({required this.id, required this.name});
}


class CustomDropdownFormField extends StatelessWidget {
  final String hint;
  final List<DropdownItem> items;
  final int? selectedId;
  final ValueChanged<int?> onChanged;

  const CustomDropdownFormField({
    super.key,
    required this.hint,
    required this.items,
    required this.selectedId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: selectedId,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
      items: items
          .map((item) => DropdownMenuItem<int>(
                value: item.id,
                child: Text(item.name),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
