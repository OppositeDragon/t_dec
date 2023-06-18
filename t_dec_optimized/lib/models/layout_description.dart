import 'package:flutter/widgets.dart';

import '/constants/enums.dart';

abstract class LayoutDescription {
  late Layout layout;
}

class SimpleLayout implements LayoutDescription {
  @override
  late Layout layout;
  List<(Widget, int)> children;
  SimpleLayout({required this.layout, required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        ),
        assert(
          layout == Layout.onlyColumn || layout == Layout.onlyRow,
          'Layout must be either column or row.',
        );
}

class ComplexLayout implements LayoutDescription {
  @override
  late Layout layout;
  List<(List<(Widget, int)>, int)> children;
  ComplexLayout({required this.layout, required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        ),
        assert(
          children.any((element) => element.$1.isNotEmpty),
          'At least one child is required on each list.',
        ),
        assert(
          layout == Layout.columnsInRow || layout == Layout.rowsInColumn,
          'Layout must be of noted type.',
        );
}
