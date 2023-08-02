import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_datatable.freezed.dart';

@freezed
class DTHeader with _$DTHeader {
  const factory DTHeader({
    required String label,
    @Default(false) bool numeric,
    @Default(null) String? tooltip,
  }) = _DTHeader;
}

@freezed
class DTRow with _$DTRow {
  const factory DTRow({
    required List<String> cells,
    @Default(null) VoidCallback? onTap,
    @Default(null) VoidCallback? onDoubleTap,
  }) = _DTRow;
}

@freezed
class DTData with _$DTData {
  factory DTData({
    required List<DTHeader> header,
    required List<DTRow> rows,
  }) = _DTData;
}
