import 'package:flutter/material.dart';
import 'package:t_dec_optimized/constants/numeric.dart';
import 'package:t_dec_optimized/models/data_datatable.dart';

class FmDataTable extends StatelessWidget {
  const FmDataTable({required this.data, super.key});
  final DataDataTable data;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: const TextStyle(fontSize: xl, fontWeight: FontWeight.bold),
      dataTextStyle: const TextStyle(fontSize: xl),
      columnSpacing: xxl,
      showCheckboxColumn: false,
      columns: [
        for (final header in data.header)
          DataColumn(
            label: Text(header.label),
            numeric: header.numeric,
            tooltip: header.tooltip,
          ),
      ],
      rows: [
        for (final row in data.rows)
          DataRow(
            cells: [
              for (final cell in row.cells)
                DataCell(
                  Text(cell),
                  onTap: row.onTap,
                  onDoubleTap: row.onDoubleTap,
                ),
            ],
          )
      ],
    );
  }
}