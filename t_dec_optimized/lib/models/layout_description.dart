import 'package:flutter/widgets.dart';

sealed class LayoutDescription {}

final class OnlyRow extends LayoutDescription {
  List<(int, Widget)> children;
  OnlyRow({required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        );
}

final class OnlyColumn implements LayoutDescription {
  List<Widget> children;
  OnlyColumn({required this.children})
      : assert(
          children.isNotEmpty,
          'At least one child is required.',
        );
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
}
