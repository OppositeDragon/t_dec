import 'package:flutter/material.dart';

class FmTextField extends StatelessWidget {
  const FmTextField({super.key,
	this.controller,required
	this.label ,
	this.hint,
	this.isDense = true,
	

	});

  ///if hint is not provided, label will be used instead.
  final String label;

  ///if hint is not provided, label will be used instead.
  final String? hint;
  final TextEditingController? controller;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint ?? label,
        label: Text(label),
        isDense: isDense,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
