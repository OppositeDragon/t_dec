// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_datatable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataDataTable {
  List<DataTableHeader> get header => throw _privateConstructorUsedError;
  List<DataTableRow> get rows => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataDataTableCopyWith<DataDataTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataDataTableCopyWith<$Res> {
  factory $DataDataTableCopyWith(
          DataDataTable value, $Res Function(DataDataTable) then) =
      _$DataDataTableCopyWithImpl<$Res, DataDataTable>;
  @useResult
  $Res call({List<DataTableHeader> header, List<DataTableRow> rows});
}

/// @nodoc
class _$DataDataTableCopyWithImpl<$Res, $Val extends DataDataTable>
    implements $DataDataTableCopyWith<$Res> {
  _$DataDataTableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? rows = null,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as List<DataTableHeader>,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<DataTableRow>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataDataTableCopyWith<$Res>
    implements $DataDataTableCopyWith<$Res> {
  factory _$$_DataDataTableCopyWith(
          _$_DataDataTable value, $Res Function(_$_DataDataTable) then) =
      __$$_DataDataTableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataTableHeader> header, List<DataTableRow> rows});
}

/// @nodoc
class __$$_DataDataTableCopyWithImpl<$Res>
    extends _$DataDataTableCopyWithImpl<$Res, _$_DataDataTable>
    implements _$$_DataDataTableCopyWith<$Res> {
  __$$_DataDataTableCopyWithImpl(
      _$_DataDataTable _value, $Res Function(_$_DataDataTable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? rows = null,
  }) {
    return _then(_$_DataDataTable(
      header: null == header
          ? _value._header
          : header // ignore: cast_nullable_to_non_nullable
              as List<DataTableHeader>,
      rows: null == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<DataTableRow>,
    ));
  }
}

/// @nodoc

class _$_DataDataTable implements _DataDataTable {
  _$_DataDataTable(
      {required final List<DataTableHeader> header,
      required final List<DataTableRow> rows})
      : assert(header.length == rows[0].cells.length,
            'header.length must be equal to cells.length'),
        _header = header,
        _rows = rows;

  final List<DataTableHeader> _header;
  @override
  List<DataTableHeader> get header {
    if (_header is EqualUnmodifiableListView) return _header;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_header);
  }

  final List<DataTableRow> _rows;
  @override
  List<DataTableRow> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  String toString() {
    return 'DataDataTable(header: $header, rows: $rows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataDataTable &&
            const DeepCollectionEquality().equals(other._header, _header) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_header),
      const DeepCollectionEquality().hash(_rows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataDataTableCopyWith<_$_DataDataTable> get copyWith =>
      __$$_DataDataTableCopyWithImpl<_$_DataDataTable>(this, _$identity);
}

abstract class _DataDataTable implements DataDataTable {
  factory _DataDataTable(
      {required final List<DataTableHeader> header,
      required final List<DataTableRow> rows}) = _$_DataDataTable;

  @override
  List<DataTableHeader> get header;
  @override
  List<DataTableRow> get rows;
  @override
  @JsonKey(ignore: true)
  _$$_DataDataTableCopyWith<_$_DataDataTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataTableHeader {
  String get label => throw _privateConstructorUsedError;
  bool get numeric => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataTableHeaderCopyWith<DataTableHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataTableHeaderCopyWith<$Res> {
  factory $DataTableHeaderCopyWith(
          DataTableHeader value, $Res Function(DataTableHeader) then) =
      _$DataTableHeaderCopyWithImpl<$Res, DataTableHeader>;
  @useResult
  $Res call({String label, bool numeric, String? tooltip});
}

/// @nodoc
class _$DataTableHeaderCopyWithImpl<$Res, $Val extends DataTableHeader>
    implements $DataTableHeaderCopyWith<$Res> {
  _$DataTableHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? numeric = null,
    Object? tooltip = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      numeric: null == numeric
          ? _value.numeric
          : numeric // ignore: cast_nullable_to_non_nullable
              as bool,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataTableHeaderCopyWith<$Res>
    implements $DataTableHeaderCopyWith<$Res> {
  factory _$$_DataTableHeaderCopyWith(
          _$_DataTableHeader value, $Res Function(_$_DataTableHeader) then) =
      __$$_DataTableHeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, bool numeric, String? tooltip});
}

/// @nodoc
class __$$_DataTableHeaderCopyWithImpl<$Res>
    extends _$DataTableHeaderCopyWithImpl<$Res, _$_DataTableHeader>
    implements _$$_DataTableHeaderCopyWith<$Res> {
  __$$_DataTableHeaderCopyWithImpl(
      _$_DataTableHeader _value, $Res Function(_$_DataTableHeader) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? numeric = null,
    Object? tooltip = freezed,
  }) {
    return _then(_$_DataTableHeader(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      numeric: null == numeric
          ? _value.numeric
          : numeric // ignore: cast_nullable_to_non_nullable
              as bool,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DataTableHeader implements _DataTableHeader {
  const _$_DataTableHeader(
      {required this.label, this.numeric = false, this.tooltip = null});

  @override
  final String label;
  @override
  @JsonKey()
  final bool numeric;
  @override
  @JsonKey()
  final String? tooltip;

  @override
  String toString() {
    return 'DataTableHeader(label: $label, numeric: $numeric, tooltip: $tooltip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataTableHeader &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.numeric, numeric) || other.numeric == numeric) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, numeric, tooltip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataTableHeaderCopyWith<_$_DataTableHeader> get copyWith =>
      __$$_DataTableHeaderCopyWithImpl<_$_DataTableHeader>(this, _$identity);
}

abstract class _DataTableHeader implements DataTableHeader {
  const factory _DataTableHeader(
      {required final String label,
      final bool numeric,
      final String? tooltip}) = _$_DataTableHeader;

  @override
  String get label;
  @override
  bool get numeric;
  @override
  String? get tooltip;
  @override
  @JsonKey(ignore: true)
  _$$_DataTableHeaderCopyWith<_$_DataTableHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataTableRow {
  List<String> get cells => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;
  VoidCallback? get onDoubleTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataTableRowCopyWith<DataTableRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataTableRowCopyWith<$Res> {
  factory $DataTableRowCopyWith(
          DataTableRow value, $Res Function(DataTableRow) then) =
      _$DataTableRowCopyWithImpl<$Res, DataTableRow>;
  @useResult
  $Res call(
      {List<String> cells, VoidCallback? onTap, VoidCallback? onDoubleTap});
}

/// @nodoc
class _$DataTableRowCopyWithImpl<$Res, $Val extends DataTableRow>
    implements $DataTableRowCopyWith<$Res> {
  _$DataTableRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
    Object? onTap = freezed,
    Object? onDoubleTap = freezed,
  }) {
    return _then(_value.copyWith(
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      onDoubleTap: freezed == onDoubleTap
          ? _value.onDoubleTap
          : onDoubleTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataTableRowCopyWith<$Res>
    implements $DataTableRowCopyWith<$Res> {
  factory _$$_DataTableRowCopyWith(
          _$_DataTableRow value, $Res Function(_$_DataTableRow) then) =
      __$$_DataTableRowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> cells, VoidCallback? onTap, VoidCallback? onDoubleTap});
}

/// @nodoc
class __$$_DataTableRowCopyWithImpl<$Res>
    extends _$DataTableRowCopyWithImpl<$Res, _$_DataTableRow>
    implements _$$_DataTableRowCopyWith<$Res> {
  __$$_DataTableRowCopyWithImpl(
      _$_DataTableRow _value, $Res Function(_$_DataTableRow) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
    Object? onTap = freezed,
    Object? onDoubleTap = freezed,
  }) {
    return _then(_$_DataTableRow(
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      onDoubleTap: freezed == onDoubleTap
          ? _value.onDoubleTap
          : onDoubleTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_DataTableRow implements _DataTableRow {
  const _$_DataTableRow(
      {required final List<String> cells,
      this.onTap = null,
      this.onDoubleTap = null})
      : _cells = cells;

  final List<String> _cells;
  @override
  List<String> get cells {
    if (_cells is EqualUnmodifiableListView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  @override
  @JsonKey()
  final VoidCallback? onTap;
  @override
  @JsonKey()
  final VoidCallback? onDoubleTap;

  @override
  String toString() {
    return 'DataTableRow(cells: $cells, onTap: $onTap, onDoubleTap: $onDoubleTap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataTableRow &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.onDoubleTap, onDoubleTap) ||
                other.onDoubleTap == onDoubleTap));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cells), onTap, onDoubleTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataTableRowCopyWith<_$_DataTableRow> get copyWith =>
      __$$_DataTableRowCopyWithImpl<_$_DataTableRow>(this, _$identity);
}

abstract class _DataTableRow implements DataTableRow {
  const factory _DataTableRow(
      {required final List<String> cells,
      final VoidCallback? onTap,
      final VoidCallback? onDoubleTap}) = _$_DataTableRow;

  @override
  List<String> get cells;
  @override
  VoidCallback? get onTap;
  @override
  VoidCallback? get onDoubleTap;
  @override
  @JsonKey(ignore: true)
  _$$_DataTableRowCopyWith<_$_DataTableRow> get copyWith =>
      throw _privateConstructorUsedError;
}
