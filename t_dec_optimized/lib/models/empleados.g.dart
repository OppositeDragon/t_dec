// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empleados.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Empleado _$$_EmpleadoFromJson(Map<String, dynamic> json) => _$_Empleado(
      identificacion: json['identificacion'] as String,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
      telCelular: json['telCelular'] as String,
      telConvencional: json['telConvencional'] as String,
      correo: json['correo'] as String,
      direccion: json['direccion'] as String,
      estado: json['estado'] as bool,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_EmpleadoToJson(_$_Empleado instance) =>
    <String, dynamic>{
      'identificacion': instance.identificacion,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'telCelular': instance.telCelular,
      'telConvencional': instance.telConvencional,
      'correo': instance.correo,
      'direccion': instance.direccion,
      'estado': instance.estado,
      'selected': instance.selected,
    };
