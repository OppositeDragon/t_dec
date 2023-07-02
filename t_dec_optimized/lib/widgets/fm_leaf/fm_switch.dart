import 'package:flutter/material.dart';
import 'package:t_dec_optimized/constants/numeric.dart';

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
              children: [
                Text(primaryText),
                Flexible(
                  child: ConstrainedBox(constraints: const BoxConstraints(minWidth: sm)),
                ),
                Text(secondaryText!),
              ],
            ),
    );
  }
}
