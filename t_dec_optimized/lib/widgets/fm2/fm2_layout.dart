import 'package:flutter/material.dart';
import 'package:t_dec_optimized/constants/enums.dart';
import 'package:t_dec_optimized/models/layout_description.dart';

class Fm2Layout extends StatelessWidget {
  const Fm2Layout({super.key, required this.layoutDescription});
  final LayoutDescription layoutDescription;
  @override
  Widget build(BuildContext context) {
    switch (layoutDescription.layout) {
      case Layout.onlyColumn:
        return Column(
          children: [
            for (final child in (layoutDescription as SimpleLayout).children)
              Flexible(
                flex: child.$1,
                child: child.$2,
              )
          ],
        );
      case Layout.onlyRow:
        return Row(
          children: [
            for (final child in (layoutDescription as SimpleLayout).children)
              Flexible(
                flex: child.$1,
                child: child.$2,
              )
          ],
        );
      case Layout.columnsInRow:
        return Row(
          children: [
            for (final child in (layoutDescription as ComplexLayout).children)
              Flexible(
                flex: child.$1,
                child: Column(
                  children: [
                    for (final innerChild in (child.$2))
                      Flexible(
                        flex: innerChild.$1,
                        child: innerChild.$2,
                      )
                  ],
                ),
              )
          ],
        );
      case Layout.rowsInColumn:
        return Column(
          children: [
            for (final child in (layoutDescription as ComplexLayout).children)
              Flexible(
                flex: child.$1,
                child: Row(
                  children: [
                    for (final innerChild in child.$2)
                      Flexible(
                        flex: innerChild.$1,
                        child: innerChild.$2,
                      )
                  ],
                ),
              )
          ],
        );
    }
  }
}
