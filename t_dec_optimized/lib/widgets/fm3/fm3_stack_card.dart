import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/numeric.dart';

class Fm3StackCard extends ConsumerWidget {
  const Fm3StackCard({
    super.key,
    required this.title,
    required this.child,
    this.actions = const [],
  });
  final Widget child;
  final String title;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(md, xl, md, sm),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.only(bottom: lg, top: xxxl, left: md, right: md),
              child: child,
            ),
          ),
          Positioned(
            top: -12,
            left: 15,
            child: Card(
              elevation: md,
              child: Padding(
                padding: const EdgeInsets.all(md),
                child: Text(
                  title,
                  style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          for (int i = 0; i < actions.length; i++)
            Positioned(
              top: -12,
              right: i * 50 + 15,
              child: actions[i],
            ),
        ],
      ),
    );
  }
}
