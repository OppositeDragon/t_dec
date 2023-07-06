import 'package:flutter/material.dart';
import 'package:t_dec_optimized/constants/enums.dart';
import 'package:t_dec_optimized/constants/numeric.dart';
import 'package:t_dec_optimized/models/layout_description.dart';

class Fm2Layout extends StatelessWidget {
  const Fm2Layout({super.key, required this.layoutDescription});
  final LayoutDescription layoutDescription;
  @override
  Widget build(BuildContext context) {
    switch (layoutDescription.layout) {
      case Layout.onlyColumn:
        List<Widget> children = [];
        for (int i = 0; i < ((layoutDescription as SimpleLayout).children.length); i++) {
          children.add(Flexible(
            flex: (layoutDescription as SimpleLayout).children[i].$1,
            child: (layoutDescription as SimpleLayout).children[i].$2,
          ));
          if (i != (layoutDescription as SimpleLayout).children.length - 1) {
            children.add(const SizedBox(height: md));
          }
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [for (final child in children) child],
        );
      case Layout.onlyRow:
        List<Widget> children = [];
        for (int i = 0; i < ((layoutDescription as SimpleLayout).children.length); i++) {
          children.add(Flexible(
            flex: (layoutDescription as SimpleLayout).children[i].$1,
            child: (layoutDescription as SimpleLayout).children[i].$2,
          ));
          if (i != (layoutDescription as SimpleLayout).children.length - 1) {
            children.add(const SizedBox(width: md));
          }
        }
        return Row(
          children: [for (final child in children) child],
        );
      case Layout.columnsInRow:
        List<Widget> children = [];
        for (int i = 0; i < ((layoutDescription as ComplexLayout).children.length); i++) {
          List<Widget> innerChildren = [];
          for (final innerChild in (layoutDescription as ComplexLayout).children[i].$2) {
            innerChildren.add(innerChild.$2);
            if (innerChild != (layoutDescription as ComplexLayout).children[i].$2.last) {
              innerChildren.add(const SizedBox(height: md));
            }
          }
          children.add(Flexible(
            flex: (layoutDescription as ComplexLayout).children[i].$1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: innerChildren,
            ),
          ));
          if (i != (layoutDescription as ComplexLayout).children.length - 1) {
            children.add(const SizedBox(width: md));
          }
        }
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: children);
      case Layout.rowsInColumn:
        List<Widget> children = [];
        for (int i = 0; i < ((layoutDescription as ComplexLayout).children.length); i++) {
          List<Widget> innerChildren = [];
          for (final innerChild in (layoutDescription as ComplexLayout).children[i].$2) {
            innerChildren.add(Flexible(fit: FlexFit.tight, flex: innerChild.$1, child: innerChild.$2));
            if (innerChild != (layoutDescription as ComplexLayout).children[i].$2.last) {
              innerChildren.add(const SizedBox(width: md));
            }
          }
          children.add(
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: innerChildren,
            ),
          );
          if (i != (layoutDescription as ComplexLayout).children.length - 1) {
            children.add(const SizedBox(height: md));
          }
        }
        return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: children);
    }
  }
}
