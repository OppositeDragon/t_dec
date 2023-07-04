import 'package:flutter/material.dart';

class FmTextField extends StatelessWidget {
  const FmTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.isDense = true,
    this.maxLines = 1,
  });

  ///if hint is not provided, label will be used instead.
  final String label;
  ///if hint is not provided, label will be used instead.
  final String? hint;
  final TextEditingController? controller;
  final bool isDense;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint ?? label,
        label: Text(label),
        isDense: isDense,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
