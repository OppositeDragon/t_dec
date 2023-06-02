import 'package:flutter/material.dart';

class MaestroEmpleadosPage extends StatefulWidget {
  const MaestroEmpleadosPage({super.key});

  @override
  State<MaestroEmpleadosPage> createState() => _MaestroEmpleadosPageState();
}

class _MaestroEmpleadosPageState extends State<MaestroEmpleadosPage> {
  bool _soloInactivos = false;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Maestro Empleados', style: textTheme.displaySmall),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const SizedBox(width: 8.0),
              const Text('Items que inician con: '),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              const Text('Solo inactivos:'),
              Checkbox(
                value: _soloInactivos,
                onChanged: (bool? value) {
                  setState(() {
                    _soloInactivos = value!;
                  });
                },
              ),
              const SizedBox(width: 16.0),
              FilledButton.tonal(onPressed: () {}, child: const Text('Consultar')),
              const SizedBox(width: 8.0),
            ],
          ),
          const Divider(thickness: 2, height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: 16,
                  showCheckboxColumn: false,
                  columns: const [
                    DataColumn(label: Text('Ced / RUC'), tooltip: 'Numero de identificacion'),
                    DataColumn(label: Text('Nombres'), tooltip: 'Nombres'),
                    DataColumn(label: Text('Telefono'), tooltip: 'Telefono'),
                    DataColumn(label: Text('E-mail'), tooltip: 'Correo electronico'),
                    DataColumn(label: Text('Direccion'), tooltip: 'Direccion'),
                    DataColumn(label: Text('Estado'), tooltip: 'Estado cliente'),
                    DataColumn(label: Text('Acciones'), tooltip: 'Acciones')
                  ],
                  rows: [
                    for (int i = 0; i < empleados.length; i++)
                      DataRow(
                        onSelectChanged: (value) {},
                        cells: [
                          DataCell(Text(empleados[i].identificacion)),
                          DataCell(Text('${empleados[i].nombres} ${empleados[i].apellidos}')),
                          DataCell(Text(empleados[i].telCelular ?? empleados[i].telConvencional ?? '')),
                          DataCell(Text(empleados[i].correo)),
                          DataCell(Text(empleados[i].direccion)),
                          DataCell(
                            empleados[i].estado
                                ? Icon(Icons.check, color: colorScheme.tertiary)
                                : Icon(Icons.close, color: colorScheme.error),
                          ),
                          DataCell(
                            Row(
                              children: [
                                IconButton(onPressed: () {}, icon: const Icon(Icons.edit), splashRadius: 25),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            title: const Text('Eliminar cliente'),
                                            content: const SizedBox(),
                                            actions: [
                                              ElevatedButton(onPressed: () {}, child: const Text('Guardar')),
                                            ],
                                          );
                                        }),
                                      );
                                    },
                                    icon: const Icon(Icons.delete_forever),
                                    splashRadius: 25),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class Empleado {
  final String identificacion;
  final String nombres;
  final String apellidos;
  final String telCelular;
  final String telConvencional;
  final String correo;
  final String direccion;
  final bool estado;
  const Empleado({
    required this.identificacion,
    required this.nombres,
    required this.apellidos,
    required this.telCelular,
    required this.telConvencional,
    required this.correo,
    required this.direccion,
    required this.estado,
  });
}

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
