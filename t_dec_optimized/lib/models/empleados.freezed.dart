// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'empleados.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Empleado _$EmpleadoFromJson(Map<String, dynamic> json) {
  return _Empleado.fromJson(json);
}

/// @nodoc
mixin _$Empleado {
  String get identificacion => throw _privateConstructorUsedError;
  String get nombres => throw _privateConstructorUsedError;
  String get apellidos => throw _privateConstructorUsedError;
  String get telCelular => throw _privateConstructorUsedError;
  String get telConvencional => throw _privateConstructorUsedError;
  String get correo => throw _privateConstructorUsedError;
  String get direccion => throw _privateConstructorUsedError;
  bool get estado => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmpleadoCopyWith<Empleado> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpleadoCopyWith<$Res> {
  factory $EmpleadoCopyWith(Empleado value, $Res Function(Empleado) then) =
      _$EmpleadoCopyWithImpl<$Res, Empleado>;
  @useResult
  $Res call(
      {String identificacion,
      String nombres,
      String apellidos,
      String telCelular,
      String telConvencional,
      String correo,
      String direccion,
      bool estado,
      bool selected});
}

/// @nodoc
class _$EmpleadoCopyWithImpl<$Res, $Val extends Empleado>
    implements $EmpleadoCopyWith<$Res> {
  _$EmpleadoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identificacion = null,
    Object? nombres = null,
    Object? apellidos = null,
    Object? telCelular = null,
    Object? telConvencional = null,
    Object? correo = null,
    Object? direccion = null,
    Object? estado = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      identificacion: null == identificacion
          ? _value.identificacion
          : identificacion // ignore: cast_nullable_to_non_nullable
              as String,
      nombres: null == nombres
          ? _value.nombres
          : nombres // ignore: cast_nullable_to_non_nullable
              as String,
      apellidos: null == apellidos
          ? _value.apellidos
          : apellidos // ignore: cast_nullable_to_non_nullable
              as String,
      telCelular: null == telCelular
          ? _value.telCelular
          : telCelular // ignore: cast_nullable_to_non_nullable
              as String,
      telConvencional: null == telConvencional
          ? _value.telConvencional
          : telConvencional // ignore: cast_nullable_to_non_nullable
              as String,
      correo: null == correo
          ? _value.correo
          : correo // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: null == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as bool,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmpleadoCopyWith<$Res> implements $EmpleadoCopyWith<$Res> {
  factory _$$_EmpleadoCopyWith(
          _$_Empleado value, $Res Function(_$_Empleado) then) =
      __$$_EmpleadoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identificacion,
      String nombres,
      String apellidos,
      String telCelular,
      String telConvencional,
      String correo,
      String direccion,
      bool estado,
      bool selected});
}

/// @nodoc
class __$$_EmpleadoCopyWithImpl<$Res>
    extends _$EmpleadoCopyWithImpl<$Res, _$_Empleado>
    implements _$$_EmpleadoCopyWith<$Res> {
  __$$_EmpleadoCopyWithImpl(
      _$_Empleado _value, $Res Function(_$_Empleado) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identificacion = null,
    Object? nombres = null,
    Object? apellidos = null,
    Object? telCelular = null,
    Object? telConvencional = null,
    Object? correo = null,
    Object? direccion = null,
    Object? estado = null,
    Object? selected = null,
  }) {
    return _then(_$_Empleado(
      identificacion: null == identificacion
          ? _value.identificacion
          : identificacion // ignore: cast_nullable_to_non_nullable
              as String,
      nombres: null == nombres
          ? _value.nombres
          : nombres // ignore: cast_nullable_to_non_nullable
              as String,
      apellidos: null == apellidos
          ? _value.apellidos
          : apellidos // ignore: cast_nullable_to_non_nullable
              as String,
      telCelular: null == telCelular
          ? _value.telCelular
          : telCelular // ignore: cast_nullable_to_non_nullable
              as String,
      telConvencional: null == telConvencional
          ? _value.telConvencional
          : telConvencional // ignore: cast_nullable_to_non_nullable
              as String,
      correo: null == correo
          ? _value.correo
          : correo // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: null == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as bool,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Empleado implements _Empleado {
  const _$_Empleado(
      {required this.identificacion,
      required this.nombres,
      required this.apellidos,
      required this.telCelular,
      required this.telConvencional,
      required this.correo,
      required this.direccion,
      required this.estado,
      this.selected = false});

  factory _$_Empleado.fromJson(Map<String, dynamic> json) =>
      _$$_EmpleadoFromJson(json);

  @override
  final String identificacion;
  @override
  final String nombres;
  @override
  final String apellidos;
  @override
  final String telCelular;
  @override
  final String telConvencional;
  @override
  final String correo;
  @override
  final String direccion;
  @override
  final bool estado;
  @override
  @JsonKey()
  final bool selected;

  @override
  String toString() {
    return 'Empleado(identificacion: $identificacion, nombres: $nombres, apellidos: $apellidos, telCelular: $telCelular, telConvencional: $telConvencional, correo: $correo, direccion: $direccion, estado: $estado, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Empleado &&
            (identical(other.identificacion, identificacion) ||
                other.identificacion == identificacion) &&
            (identical(other.nombres, nombres) || other.nombres == nombres) &&
            (identical(other.apellidos, apellidos) ||
                other.apellidos == apellidos) &&
            (identical(other.telCelular, telCelular) ||
                other.telCelular == telCelular) &&
            (identical(other.telConvencional, telConvencional) ||
                other.telConvencional == telConvencional) &&
            (identical(other.correo, correo) || other.correo == correo) &&
            (identical(other.direccion, direccion) ||
                other.direccion == direccion) &&
            (identical(other.estado, estado) || other.estado == estado) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      identificacion,
      nombres,
      apellidos,
      telCelular,
      telConvencional,
      correo,
      direccion,
      estado,
      selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmpleadoCopyWith<_$_Empleado> get copyWith =>
      __$$_EmpleadoCopyWithImpl<_$_Empleado>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmpleadoToJson(
      this,
    );
  }
}

abstract class _Empleado implements Empleado {
  const factory _Empleado(
      {required final String identificacion,
      required final String nombres,
      required final String apellidos,
      required final String telCelular,
      required final String telConvencional,
      required final String correo,
      required final String direccion,
      required final bool estado,
      final bool selected}) = _$_Empleado;

  factory _Empleado.fromJson(Map<String, dynamic> json) = _$_Empleado.fromJson;

  @override
  String get identificacion;
  @override
  String get nombres;
  @override
  String get apellidos;
  @override
  String get telCelular;
  @override
  String get telConvencional;
  @override
  String get correo;
  @override
  String get direccion;
  @override
  bool get estado;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$_EmpleadoCopyWith<_$_Empleado> get copyWith =>
      throw _privateConstructorUsedError;
}
