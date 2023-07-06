import 'package:freezed_annotation/freezed_annotation.dart';
part 'empleados.freezed.dart';
part 'empleados.g.dart';

@freezed
class Empleado with _$Empleado {
  const factory Empleado({
    required String identificacion,
    required String nombres,
    required String apellidos,
    required String telCelular,
    required String telConvencional,
    required String correo,
    required String direccion,
    required bool estado,
    @Default(false) bool selected,
  }) = _Empleado;

  factory Empleado.fromJson(Map<String, Object?> json) => _$EmpleadoFromJson(json);
}
