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
mixin _$DTHeader {
  String get label => throw _privateConstructorUsedError;
  bool get numeric => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DTHeaderCopyWith<DTHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DTHeaderCopyWith<$Res> {
  factory $DTHeaderCopyWith(DTHeader value, $Res Function(DTHeader) then) =
      _$DTHeaderCopyWithImpl<$Res, DTHeader>;
  @useResult
  $Res call({String label, bool numeric, String? tooltip});
}

/// @nodoc
class _$DTHeaderCopyWithImpl<$Res, $Val extends DTHeader>
    implements $DTHeaderCopyWith<$Res> {
  _$DTHeaderCopyWithImpl(this._value, this._then);

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
abstract class _$$_DTHeaderCopyWith<$Res> implements $DTHeaderCopyWith<$Res> {
  factory _$$_DTHeaderCopyWith(
          _$_DTHeader value, $Res Function(_$_DTHeader) then) =
      __$$_DTHeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, bool numeric, String? tooltip});
}

/// @nodoc
class __$$_DTHeaderCopyWithImpl<$Res>
    extends _$DTHeaderCopyWithImpl<$Res, _$_DTHeader>
    implements _$$_DTHeaderCopyWith<$Res> {
  __$$_DTHeaderCopyWithImpl(
      _$_DTHeader _value, $Res Function(_$_DTHeader) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? numeric = null,
    Object? tooltip = freezed,
  }) {
    return _then(_$_DTHeader(
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

class _$_DTHeader implements _DTHeader {
  const _$_DTHeader(
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
    return 'DTHeader(label: $label, numeric: $numeric, tooltip: $tooltip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DTHeader &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.numeric, numeric) || other.numeric == numeric) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, numeric, tooltip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DTHeaderCopyWith<_$_DTHeader> get copyWith =>
      __$$_DTHeaderCopyWithImpl<_$_DTHeader>(this, _$identity);
}

abstract class _DTHeader implements DTHeader {
  const factory _DTHeader(
      {required final String label,
      final bool numeric,
      final String? tooltip}) = _$_DTHeader;

  @override
  String get label;
  @override
  bool get numeric;
  @override
  String? get tooltip;
  @override
  @JsonKey(ignore: true)
  _$$_DTHeaderCopyWith<_$_DTHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DTRow {
  List<String> get cells => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;
  VoidCallback? get onDoubleTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DTRowCopyWith<DTRow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DTRowCopyWith<$Res> {
  factory $DTRowCopyWith(DTRow value, $Res Function(DTRow) then) =
      _$DTRowCopyWithImpl<$Res, DTRow>;
  @useResult
  $Res call(
      {List<String> cells, VoidCallback? onTap, VoidCallback? onDoubleTap});
}

/// @nodoc
class _$DTRowCopyWithImpl<$Res, $Val extends DTRow>
    implements $DTRowCopyWith<$Res> {
  _$DTRowCopyWithImpl(this._value, this._then);

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
abstract class _$$_DTRowCopyWith<$Res> implements $DTRowCopyWith<$Res> {
  factory _$$_DTRowCopyWith(_$_DTRow value, $Res Function(_$_DTRow) then) =
      __$$_DTRowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> cells, VoidCallback? onTap, VoidCallback? onDoubleTap});
}

/// @nodoc
class __$$_DTRowCopyWithImpl<$Res> extends _$DTRowCopyWithImpl<$Res, _$_DTRow>
    implements _$$_DTRowCopyWith<$Res> {
  __$$_DTRowCopyWithImpl(_$_DTRow _value, $Res Function(_$_DTRow) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
    Object? onTap = freezed,
    Object? onDoubleTap = freezed,
  }) {
    return _then(_$_DTRow(
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

class _$_DTRow implements _DTRow {
  const _$_DTRow(
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
    return 'DTRow(cells: $cells, onTap: $onTap, onDoubleTap: $onDoubleTap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DTRow &&
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
  _$$_DTRowCopyWith<_$_DTRow> get copyWith =>
      __$$_DTRowCopyWithImpl<_$_DTRow>(this, _$identity);
}

abstract class _DTRow implements DTRow {
  const factory _DTRow(
      {required final List<String> cells,
      final VoidCallback? onTap,
      final VoidCallback? onDoubleTap}) = _$_DTRow;

  @override
  List<String> get cells;
  @override
  VoidCallback? get onTap;
  @override
  VoidCallback? get onDoubleTap;
  @override
  @JsonKey(ignore: true)
  _$$_DTRowCopyWith<_$_DTRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DTData {
  List<DTHeader> get header => throw _privateConstructorUsedError;
  List<DTRow> get rows => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DTDataCopyWith<DTData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DTDataCopyWith<$Res> {
  factory $DTDataCopyWith(DTData value, $Res Function(DTData) then) =
      _$DTDataCopyWithImpl<$Res, DTData>;
  @useResult
  $Res call({List<DTHeader> header, List<DTRow> rows});
}

/// @nodoc
class _$DTDataCopyWithImpl<$Res, $Val extends DTData>
    implements $DTDataCopyWith<$Res> {
  _$DTDataCopyWithImpl(this._value, this._then);

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
              as List<DTHeader>,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<DTRow>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DTDataCopyWith<$Res> implements $DTDataCopyWith<$Res> {
  factory _$$_DTDataCopyWith(_$_DTData value, $Res Function(_$_DTData) then) =
      __$$_DTDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DTHeader> header, List<DTRow> rows});
}

/// @nodoc
class __$$_DTDataCopyWithImpl<$Res>
    extends _$DTDataCopyWithImpl<$Res, _$_DTData>
    implements _$$_DTDataCopyWith<$Res> {
  __$$_DTDataCopyWithImpl(_$_DTData _value, $Res Function(_$_DTData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? rows = null,
  }) {
    return _then(_$_DTData(
      header: null == header
          ? _value._header
          : header // ignore: cast_nullable_to_non_nullable
              as List<DTHeader>,
      rows: null == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<DTRow>,
    ));
  }
}

/// @nodoc

class _$_DTData implements _DTData {
  _$_DTData(
      {required final List<DTHeader> header, required final List<DTRow> rows})
      : _header = header,
        _rows = rows;

  final List<DTHeader> _header;
  @override
  List<DTHeader> get header {
    if (_header is EqualUnmodifiableListView) return _header;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_header);
  }

  final List<DTRow> _rows;
  @override
  List<DTRow> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  String toString() {
    return 'DTData(header: $header, rows: $rows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DTData &&
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
  _$$_DTDataCopyWith<_$_DTData> get copyWith =>
      __$$_DTDataCopyWithImpl<_$_DTData>(this, _$identity);
}

abstract class _DTData implements DTData {
  factory _DTData(
      {required final List<DTHeader> header,
      required final List<DTRow> rows}) = _$_DTData;

  @override
  List<DTHeader> get header;
  @override
  List<DTRow> get rows;
  @override
  @JsonKey(ignore: true)
  _$$_DTDataCopyWith<_$_DTData> get copyWith =>
      throw _privateConstructorUsedError;
}
