import 'package:flutter/material.dart';

class FmSwitch extends StatelessWidget {
  const FmSwitch({
    super.key,
    required this.onChanged,
    required this.primaryText,
    this.secondaryText,
    required this.value,
  });
  final bool value;
  final Function(bool)? onChanged;
  final String primaryText;
  final String? secondaryText;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: secondaryText == null
          ? Text(primaryText)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(primaryText),
                Text(secondaryText!),
              ],
            ),
    );
  }
}
