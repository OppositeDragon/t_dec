import 'package:flutter/material.dart';
import 'package:t_dec_optimized/constants/numeric.dart';

class FmFilledIconButton extends StatelessWidget {
  const FmFilledIconButton({
    super.key,
    this.onPressed,
    required this.child,
    this.icon,
  });
	
  final void Function()? onPressed;
  final String child;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      key: key,
      onPressed: onPressed,
      child: icon == null
          ? Text(child)
          : Row(
              children: [
                icon!,
                const SizedBox(width: sm),
                Flexible(child: Text(child)),
              ],
            ),
    );
  }
}
