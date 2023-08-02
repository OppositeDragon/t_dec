import 'package:flutter/material.dart';
import 'package:t_dec_optimized/models/layout_description.dart';

class Fm2Layout extends StatelessWidget {
  const Fm2Layout({super.key, required this.layoutDescription});
  final LayoutDescription layoutDescription;
  @override
  Widget build(BuildContext context) {
    switch (layoutDescription) {
      case OnlyRow data:
        return data.childrenWithSpacing();
      case OnlyColumn data:
        return data.childrenWithSpacing();
      case RowsInColumn data:
        return data.childrenWithSpacing();
      case ColumnsInRow data:
        return data.childrenWithSpacing();
    }
  }
}
