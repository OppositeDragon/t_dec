import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_datatable.freezed.dart';

@freezed
class DataDataTable with _$DataDataTable {
  @Assert('header.length == rows[0].cells.length', 'header.length must be equal to cells.length')
  factory DataDataTable({
    required List<DataTableHeader> header,
    required List<DataTableRow> rows,
  }) = _DataDataTable;
}

@freezed
class DataTableHeader with _$DataTableHeader {
  const factory DataTableHeader({
    required String label,
    @Default(false) bool numeric,
    @Default(null) String? tooltip,
  }) = _DataTableHeader;
}

@freezed
class DataTableRow with _$DataTableRow {
  const factory DataTableRow({
    required List<String> cells,
    @Default(null) VoidCallback? onTap,
    @Default(null) VoidCallback? onDoubleTap,
  }) = _DataTableRow;
}
