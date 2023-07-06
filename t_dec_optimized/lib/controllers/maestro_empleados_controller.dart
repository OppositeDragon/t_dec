import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/empleados.dart';

part 'maestro_empleados_controller.g.dart';

@riverpod
class EmpleadosController extends _$EmpleadosController {
  @override
  List<Empleado> build() {
    final empleados = [
      const Empleado(
          identificacion: '0101010101',
          nombres: 'Juan',
          apellidos: 'Perez',
          telCelular: '0999999999',
          telConvencional: '022222222',
          correo: 'juanperez@emai.com',
          direccion: 'Quito',
          estado: true),
      const Empleado(
          identificacion: '0101010102',
          nombres: 'Maria',
          apellidos: 'Perez',
          telCelular: '0999999999',
          telConvencional: '022222222',
          correo: 'mariapez@email.com',
          direccion: 'Quito',
          estado: true),
      const Empleado(
          identificacion: '0101010103',
          nombres: 'Luis',
          apellidos: 'Perez',
          telCelular: '0999999999',
          telConvencional: '022222222',
          correo: 'luisperez@emai.com',
          direccion: 'Quito',
          estado: true),
      const Empleado(
          identificacion: '0101010104',
          nombres: 'Alberto',
          apellidos: 'Sachez',
          telCelular: '0999999999',
          telConvencional: '022222222',
          correo: '',
          direccion: 'Quito',
          estado: false),
    ];
    return empleados;
  }
}
