import 'package:flutter/material.dart';
import 'package:t_dec_optimized/constants/numeric.dart';
import 'package:t_dec_optimized/models/layout_description.dart';

class Fm2Layout extends StatelessWidget {
  const Fm2Layout({super.key, required this.layoutDescription});
  final LayoutDescription layoutDescription;
  @override
  Widget build(BuildContext context) {
    switch (layoutDescription) {
      case OnlyRow data:
        List<Widget> children = [];
        for (int i = 0; i < (data.children.length); i++) {
          children.add(Flexible(
            flex: data.children[i].$1,
            child: data.children[i].$2,
          ));
          if (i != data.children.length - 1) {
            children.add(const SizedBox(width: md));
          }
        }
        return Row(
          children: [for (final child in children) child],
        );
      case OnlyColumn data:
        List<Widget> children = [];
        for (int i = 0; i < (data.children.length); i++) {
          children.add(
            data.children[i],
          );
          if (i != data.children.length - 1) {
            children.add(const SizedBox(height: md));
          }
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        );
      case RowsInColumn data:
        List<Widget> children = [];
        for (int i = 0; i < (data.children.length); i++) {
          List<Widget> innerChildren = [];
          for (final innerChild in data.children[i]) {
            innerChildren.add(Flexible(fit: FlexFit.tight, flex: innerChild.$1, child: innerChild.$2));
            if (innerChild != data.children[i].last) {
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
          if (i != data.children.length - 1) {
            children.add(const SizedBox(height: md));
          }
        }
        return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: children);
      case ColumnsInRow data:
        List<Widget> children = [];
        for (int i = 0; i < (data.children.length); i++) {
          List<Widget> innerChildren = [];
          for (final innerChild in data.children[i].$2) {
            innerChildren.add(innerChild);
            if (innerChild != data.children[i].$2.last) {
              innerChildren.add(const SizedBox(height: md));
            }
          }
          children.add(Flexible(
            flex: data.children[i].$1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: innerChildren,
            ),
          ));
          if (i != data.children.length - 1) {
            children.add(const SizedBox(width: md));
          }
        }
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: children);
    }
  }
}
