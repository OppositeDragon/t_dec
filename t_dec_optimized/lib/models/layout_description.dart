import 'package:flutter/widgets.dart';

import '../constants/numeric.dart';

sealed class LayoutDescription {
  Widget childrenWithSpacing();
}

final class OnlyRow extends LayoutDescription {
  List<(int, Widget)> children;
  OnlyRow({required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        );

  @override
  Widget childrenWithSpacing() {
    List<Widget> childrenWithSpacing = [];
    for (int i = 0; i < (children.length); i++) {
      childrenWithSpacing.add(
        Flexible(
          flex: children[i].$1,
          child: children[i].$2,
        ),
      );
      if (i != children.length - 1) {
        childrenWithSpacing.add(const SizedBox(width: md));
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrenWithSpacing,
    );
  }
}

final class OnlyColumn implements LayoutDescription {
  List<Widget> children;
  OnlyColumn({required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        );

  @override
  Widget childrenWithSpacing() {
    List<Widget> childrenWithSpacing = [];
    for (int i = 0; i < (children.length); i++) {
      childrenWithSpacing.add(
        children[i],
      );
      if (i != children.length - 1) {
        childrenWithSpacing.add(const SizedBox(height: md));
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: childrenWithSpacing,
    );
  }
}

final class RowsInColumn implements LayoutDescription {
  List<List<(int, Widget)>> children;
  RowsInColumn({required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        ),
        assert(
          children.any((element) => element.isNotEmpty),
          'At least one child is required on each list.',
        );

  @override
  Widget childrenWithSpacing() {
    List<Widget> childrenWithSpacing = [];
    for (int i = 0; i < (children.length); i++) {
      List<Widget> innerChildren = [];
      for (final innerChild in children[i]) {
        innerChildren.add(Flexible(fit: FlexFit.tight, flex: innerChild.$1, child: innerChild.$2));
        if (innerChild != children[i].last) {
          innerChildren.add(const SizedBox(width: md));
        }
      }
      childrenWithSpacing.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: innerChildren,
        ),
      );
      if (i != childrenWithSpacing.length - 1) {
        childrenWithSpacing.add(const SizedBox(height: md));
      }
    }
    return Column(
        mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: childrenWithSpacing);
  }
}

final class ColumnsInRow implements LayoutDescription {
  List<(int, List<Widget>)> children;
  ColumnsInRow({required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        ),
        assert(
          children.any((element) => element.$2.isNotEmpty),
          'At least one child is required on each list.',
        );

  @override
  Widget childrenWithSpacing() {
    List<Widget> childrenWithSpacing = [];
    for (int i = 0; i < (children.length); i++) {
      List<Widget> innerChildren = [];
      for (final innerChild in children[i].$2) {
        innerChildren.add(innerChild);
        if (innerChild != children[i].$2.last) {
          innerChildren.add(const SizedBox(height: md));
        }
      }
      childrenWithSpacing.add(Flexible(
        flex: children[i].$1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: innerChildren,
        ),
      ));
      if (i != children.length - 1) {
        childrenWithSpacing.add(const SizedBox(width: md));
      }
    }
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: childrenWithSpacing);
  }
}
