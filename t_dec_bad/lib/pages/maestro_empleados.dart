import 'dart:convert';

import 'package:flutter/material.dart';

class MaestroEmpleadosPage extends StatefulWidget {
  const MaestroEmpleadosPage({super.key});

  @override
  State<MaestroEmpleadosPage> createState() => _MaestroEmpleadosPageState();
}

class _MaestroEmpleadosPageState extends State<MaestroEmpleadosPage> {
  bool _soloInactivos = false;
  int _page = 0;
  String identificacion = '';
  late final PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(keepPage: true, initialPage: _page);
  }

  void animateToPage(int page) =>
      _controller.animateToPage(page, duration: const Duration(milliseconds: 350), curve: Curves.ease);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return PageView(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 12.0),
                Text('Maestro Empleados', style: textTheme.displaySmall),
                const Spacer(),
                const SizedBox(width: 16.0),
                FilledButton.icon(
                  onPressed: () {
                    identificacion = '';
                    animateToPage(1);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Nuevo'),
                ),
                const SizedBox(width: 16.0),
              ],
            ),
            const SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Items que inician con: ',
                          label: Text('Items que inician con: '),
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 190,
                      child: SwitchListTile(
                        title: _soloInactivos ? const Text('todos') : const Text('inactivos'),
                        value: _soloInactivos,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _soloInactivos = value!;
                            },
                          );
                        },
                      ),
                    ),
                    FilledButton.tonal(onPressed: () {}, child: const Text('Consultar')),
                  ],
                ),
              ),
            ),
            const Divider(thickness: 2, height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        headingTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        dataTextStyle: const TextStyle(fontSize: 16),
                        columnSpacing: 16,
                        showCheckboxColumn: false,
                        columns: [
                          const DataColumn(label: Text('Ced / RUC'), tooltip: 'Numero de identificacion'),
                          const DataColumn(label: Text('Nombres'), tooltip: 'Nombres'),
                          const DataColumn(label: Text('Telefono'), tooltip: 'Telefono'),
                          if (constraints.maxWidth > 700)
                            const DataColumn(label: Text('E-mail'), tooltip: 'Correo electronico'),
                          if (constraints.maxWidth > 700)
                            const DataColumn(label: Text('Direccion'), tooltip: 'Direccion'),
                          const DataColumn(label: Text('Estado'), tooltip: 'Estado cliente'),
                        ],
                        rows: [
                          for (int i = 0; i < empleados.length; i++)
                            DataRow(
                              onSelectChanged: (value) {
                                // setState(() {
                                //   empleados[i] = empleados[i].copyWith(selected: value);
                                // });
                              },
                              selected: empleados[i].selected,
                              cells: [
                                DataCell(
                                  Text(empleados[i].identificacion),
                                  onTap: () {
                                    setState(() {
                                      for (int j = 0; j < empleados.length; j++) {
                                        if (j != i) {
                                          empleados[j] = empleados[j].copyWith(selected: false);
                                        } else {
                                          empleados[j] = empleados[j].copyWith(selected: !empleados[j].selected);
                                        }
                                      }
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      identificacion = empleados[i].identificacion;
                                      animateToPage(1);
                                    });
                                  },
                                ),
                                DataCell(
                                  Text('${empleados[i].nombres} ${empleados[i].apellidos}'),
                                  onTap: () {
                                    setState(() {
                                      for (int j = 0; j < empleados.length; j++) {
                                        if (j != i) {
                                          empleados[j] = empleados[j].copyWith(selected: false);
                                        } else {
                                          empleados[j] = empleados[j].copyWith(selected: !empleados[j].selected);
                                        }
                                      }
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      identificacion = empleados[i].identificacion;
                                      animateToPage(1);
                                    });
                                  },
                                ),
                                DataCell(
                                  Text(empleados[i].telCelular ?? empleados[i].telConvencional ?? ''),
                                  onTap: () {
                                    setState(() {
                                      for (int j = 0; j < empleados.length; j++) {
                                        if (j != i) {
                                          empleados[j] = empleados[j].copyWith(selected: false);
                                        } else {
                                          empleados[j] = empleados[j].copyWith(selected: !empleados[j].selected);
                                        }
                                      }
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      identificacion = empleados[i].identificacion;
                                      animateToPage(1);
                                    });
                                  },
                                ),
                                if (constraints.maxWidth > 700)
                                  DataCell(
                                    Text(empleados[i].correo),
                                    onTap: () {
                                      setState(() {
                                        for (int j = 0; j < empleados.length; j++) {
                                          if (j != i) {
                                            empleados[j] = empleados[j].copyWith(selected: false);
                                          } else {
                                            empleados[j] = empleados[j].copyWith(selected: !empleados[j].selected);
                                          }
                                        }
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        identificacion = empleados[i].identificacion;
                                        animateToPage(1);
                                      });
                                    },
                                  ),
                                if (constraints.maxWidth > 700)
                                  DataCell(
                                    Text(empleados[i].direccion),
                                    onTap: () {
                                      setState(() {
                                        for (int j = 0; j < empleados.length; j++) {
                                          if (j != i) {
                                            empleados[j] = empleados[j].copyWith(selected: false);
                                          } else {
                                            empleados[j] = empleados[j].copyWith(selected: !empleados[j].selected);
                                          }
                                        }
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        identificacion = empleados[i].identificacion;
                                        animateToPage(1);
                                      });
                                    },
                                  ),
                                DataCell(
                                  empleados[i].estado
                                      ? Icon(Icons.check, color: colorScheme.tertiary)
                                      : Icon(Icons.close, color: colorScheme.error),
                                  onTap: () {
                                    setState(() {
                                      for (int j = 0; j < empleados.length; j++) {
                                        if (j != i) {
                                          empleados[j] = empleados[j].copyWith(selected: false);
                                        } else {
                                          empleados[j] = empleados[j].copyWith(selected: !empleados[j].selected);
                                        }
                                      }
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      identificacion = empleados[i].identificacion;
                                      animateToPage(1);
                                    });
                                  },
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        _page = 0;
                        animateToPage(_page);
                      },
                    );
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  label: const Text('Eliminar'),
                ),
                const SizedBox(width: 8.0),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar'),
                ),
                const SizedBox(width: 16.0),
              ],
            ),
            Expanded(
              child: DefaultTabController(
                length: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'Informacion General'),
                        Tab(text: 'Sueldo y acreditaciones'),
                        Tab(text: 'Cargas Familiares'),
                        Tab(text: 'Impuesto a la renta'),
                        Tab(text: 'Entradas y salidas'),
                        Tab(text: 'Vacaciones'),
                        Tab(text: 'Mas Datos'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Apellidos: '),
                                                  hintText: 'Apellidos',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Nombres: '),
                                                  hintText: 'Nombres',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 3,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Codigo: '),
                                                  hintText: 'Codigo',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nombres',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Cedula Identidad',
                                                      label: Text('Cedula Identidad'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Cargo',
                                                      label: Text('Cargo'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Codigo IESS',
                                                      label: Text('Codigo IESS'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Fecha Nacimiento',
                                                      label: Text('Fecha Nacimiento'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16.0),
                                                const Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Cod. Ocupacional',
                                                      label: Text('Cod. Ocupacional'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      const Text('Estado: '),
                                                      const Spacer(),
                                                      Text(_soloInactivos ? 'activo' : 'inactivo'),
                                                      Switch(
                                                        value: _soloInactivos,
                                                        onChanged: (bool value) {
                                                          setState(
                                                            () {
                                                              _soloInactivos = value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Datos basicos',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                          padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      decoration: InputDecoration(
                                                        label: Text('Direccion 1 '),
                                                        hintText: 'Direccion',
                                                        isDense: true,
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    TextField(
                                                      decoration: InputDecoration(
                                                        label: Text('Direccion 2 '),
                                                        hintText: 'Direccion',
                                                        isDense: true,
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    TextField(
                                                      decoration: InputDecoration(
                                                        label: Text('Direccion 3 '),
                                                        hintText: 'Direccion',
                                                        isDense: true,
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 16.0),
                                              Flexible(
                                                flex: 1,
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      decoration: InputDecoration(
                                                        label: Text('Telefono 1 '),
                                                        hintText: 'Telefono',
                                                        isDense: true,
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    TextField(
                                                      decoration: InputDecoration(
                                                        label: Text('Telefono 2 '),
                                                        hintText: 'Telefono',
                                                        isDense: true,
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    TextField(
                                                      decoration: InputDecoration(
                                                        label: Text('Telefono 3 '),
                                                        hintText: 'Telefono',
                                                        isDense: true,
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 16.0),
                                              Flexible(
                                                flex: 2,
                                                child: TextField(
                                                  maxLines: 5,
                                                  decoration: InputDecoration(
                                                    label: Text('Observaciones'),
                                                    hintText: 'obs...',
                                                    border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Direccion',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          const Card(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      label: Text('Departamento'),
                                                      hintText: 'Departamento',
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      label: Text('Cuenta contable'),
                                                      hintText: 'Cuenta contable',
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      label: Text('Centro de costo'),
                                                      hintText: 'Centro de costo',
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -14,
                                            left: 15,
                                            child: Card(
                                              elevation: 15,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Enlaces',
                                                  style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Stack(
                                        fit: StackFit.passthrough,
                                        clipBehavior: Clip.none,
                                        children: [
                                          const Card(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(height: 150, child: FlutterLogo(size: 100)),
                                                  SizedBox(height: 8),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -14,
                                            left: 15,
                                            child: Card(
                                              elevation: 15,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Foto',
                                                  style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -14,
                                            right: 65,
                                            child: IconButton.filledTonal(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {},
                                            ),
                                          ),
                                          Positioned(
                                            top: -14,
                                            right: 15,
                                            child: IconButton.filledTonal(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Apellidos: '),
                                                  hintText: 'Apellidos',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Nombres: '),
                                                  hintText: 'Nombres',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 3,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Codigo: '),
                                                  hintText: 'Codigo',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nombres',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Sueldo Base',
                                                      label: Text('Sueldo Base'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 1,
                                                  fit: FlexFit.tight,
                                                  child: SizedBox(),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Tipo contrato',
                                                      label: Text('Tipo contrato'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Forma pago D13',
                                                      label: Text('Forma pago D13'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Forma pago D14',
                                                      label: Text('Forma pago D14'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 1,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Forma pago FON',
                                                      label: Text('Forma pago FON'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Informacion del sueldo',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 5,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Forma pago',
                                                      label: Text('Forma pago'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 3,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Cuenta corriente',
                                                      label: Text('Cuenta corriente'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 5,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Hacia el banco',
                                                      label: Text('Hacia  el banco'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 3,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Cuenta ahorros',
                                                      label: Text('Cuenta ahorros'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 5,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Correo electronico',
                                                      label: Text('Correo electronico'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.0),
                                                Flexible(
                                                  flex: 3,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Cuenta virtual',
                                                      label: Text('Cuenta virtual'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Informacion de la forma de pago preferida',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(children: [
                                          Spacer(),
                                          Flexible(
                                            flex: 3,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Forma pago',
                                                label: Text('Forma de pago para el mes actual: '),
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                        ]),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Informacion de forma de pago parael mes actual',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Apellidos: '),
                                                  hintText: 'Apellidos',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Nombres: '),
                                                  hintText: 'Nombres',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 3,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Codigo: '),
                                                  hintText: 'Codigo',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nombres',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Flexible(
                                              flex: 1,
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Estado  civil',
                                                      label: Text('Estado  civil'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Tipo de carga',
                                                      label: Text('Tipo de carga'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Nombres',
                                                      label: Text('Nombres'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Fecha nacimiento',
                                                      label: Text('Fecha nacimiento'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        flex: 3,
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Edad',
                                                            label: Text('Edad'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(flex: 1, fit: FlexFit.tight, child: SizedBox()),
                                                      Flexible(
                                                        flex: 3,
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Genero',
                                                            label: Text('Genero'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    maxLines: 3,
                                                    decoration: InputDecoration(
                                                      hintText: 'Genero',
                                                      label: Text('Genero'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 1,
                                              child: SingleChildScrollView(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: DataTable(
                                                    headingTextStyle:
                                                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                    dataTextStyle: const TextStyle(fontSize: 16),
                                                    columns: const [
                                                      DataColumn(label: Text('Relacion')),
                                                      DataColumn(label: Text('Nombres')),
                                                      DataColumn(label: Text('Edad'), numeric: true),
                                                    ],
                                                    rows: const [
                                                      DataRow(
                                                        cells: [
                                                          DataCell(Text('Hijo')),
                                                          DataCell(Text('Juan Perez')),
                                                          DataCell(Text('12')),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Informacion del sueldo',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: 65,
                                      child: IconButton.filledTonal(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: 15,
                                      child: IconButton.filledTonal(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            //impuesto a la renta
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Apellidos: '),
                                                  hintText: 'Apellidos',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Nombres: '),
                                                  hintText: 'Nombres',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 3,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Codigo: '),
                                                  hintText: 'Codigo',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nombres',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 5,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          const Card(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Enero',
                                                            label: Text('Ingresos Enero'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Enero',
                                                            label: Text('Impuestos Enero'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Febrero',
                                                            label: Text('Ingresos Febrero'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Febrero',
                                                            label: Text('Impuestos Febrero'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Marzo',
                                                            label: Text('Ingresos Marzo'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Marzo',
                                                            label: Text('Impuestos Marzo'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Abril',
                                                            label: Text('Ingresos Abril'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Abril',
                                                            label: Text('Impuestos Abril'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Mayo',
                                                            label: Text('Ingresos Mayo'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Mayo',
                                                            label: Text('Impuestos Mayo'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Junio',
                                                            label: Text('Ingresos Junio'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Junio',
                                                            label: Text('Impuestos Junio'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Julio',
                                                            label: Text('Ingresos Julio'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Julio',
                                                            label: Text('Impuestos Julio'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Agosto',
                                                            label: Text('Ingresos Agosto'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Agosto',
                                                            label: Text('Impuestos Agosto'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Septiembre',
                                                            label: Text('Ingresos Septiembre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Septiembre',
                                                            label: Text('Impuestos Septiembre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Octubre',
                                                            label: Text('Ingresos Octubre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Octubre',
                                                            label: Text('Impuestos Octubre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Noviembre',
                                                            label: Text('Ingresos Noviembre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Noviembre',
                                                            label: Text('Impuestos Noviembre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Ingresos Diciembre',
                                                            label: Text('Ingresos Diciembre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.0),
                                                      Flexible(
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'Impuestos Diciembre',
                                                            label: Text('Impuestos Diciembre'),
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -14,
                                            left: 15,
                                            child: Card(
                                              elevation: 15,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Informacion del sueldo',
                                                  style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              const Card(
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Estimado Anual',
                                                      label: Text('Estimado Anual'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: -14,
                                                left: 15,
                                                child: Card(
                                                  elevation: 15,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Gastos Personales',
                                                      style:
                                                          textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              const Card(
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                                  child: Column(
                                                    children: [
                                                      TextField(
                                                        decoration: InputDecoration(
                                                          hintText: 'Por utilidades',
                                                          label: Text('Por utilidades'),
                                                          isDense: true,
                                                          border: OutlineInputBorder(),
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      TextField(
                                                        decoration: InputDecoration(
                                                          hintText: 'Como sobresueldos',
                                                          label: Text('Como sobresueldos'),
                                                          isDense: true,
                                                          border: OutlineInputBorder(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: -14,
                                                left: 15,
                                                child: Card(
                                                  elevation: 15,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Otros ingresos',
                                                      style:
                                                          textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              const Card(
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                                  child: Column(
                                                    children: [
                                                      TextField(
                                                        decoration: InputDecoration(
                                                          hintText: 'Ingresos',
                                                          label: Text('Ingresos'),
                                                          isDense: true,
                                                          border: OutlineInputBorder(),
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      TextField(
                                                        decoration: InputDecoration(
                                                          hintText: 'Retenciones',
                                                          label: Text('Retenciones'),
                                                          isDense: true,
                                                          border: OutlineInputBorder(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: -14,
                                                left: 15,
                                                child: Card(
                                                  elevation: 15,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Por  otros empleadores',
                                                      style:
                                                          textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              const Card(
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                                  child: Column(
                                                    children: [
                                                      TextField(
                                                        decoration: InputDecoration(
                                                          hintText: 'TOTAL INGRESOS',
                                                          label: Text('TOTAL INGRESOS'),
                                                          isDense: true,
                                                          border: OutlineInputBorder(),
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      TextField(
                                                        decoration: InputDecoration(
                                                          hintText: 'TOTAL DESCUENTOS',
                                                          label: Text('TOTAL DESCUENTOS'),
                                                          isDense: true,
                                                          border: OutlineInputBorder(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: -14,
                                                left: 15,
                                                child: Card(
                                                  elevation: 15,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'RESUMEN',
                                                      style:
                                                          textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Apellidos: '),
                                                  hintText: 'Apellidos',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Nombres: '),
                                                  hintText: 'Nombres',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 3,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Codigo: '),
                                                  hintText: 'Codigo',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nombres',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              flex: 4,
                                              child: Column(
                                                children: [
                                                  SwitchListTile(
                                                    title: const Text('Califica para fondo de reserva: '),
                                                    value: true,
                                                    onChanged: (bool value) {},
                                                  ),
                                                  const TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Entradas',
                                                      label: Text('Entradas'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  const TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Salidas',
                                                      label: Text('Salidas'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  const TextField(
                                                    maxLines: 3,
                                                    decoration: InputDecoration(
                                                      hintText: 'Notas',
                                                      label: Text('Notas'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 6,
                                              child: SingleChildScrollView(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: DataTable(
                                                    headingTextStyle:
                                                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                    dataTextStyle: const TextStyle(fontSize: 16),
                                                    columns: const [
                                                      DataColumn(label: Text('Entradas')),
                                                      DataColumn(label: Text('Salidas')),
                                                      DataColumn(label: Text('Notas')),
                                                    ],
                                                    rows: const [
                                                      DataRow(
                                                        cells: [
                                                          DataCell(Text('ent')),
                                                          DataCell(Text('salida')),
                                                          DataCell(Text('notas notas')),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Detalle de las fechas de entradas y salidas a la Empresa',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: 65,
                                      child: IconButton.filledTonal(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: 15,
                                      child: IconButton.filledTonal(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Apellidos: '),
                                                  hintText: 'Apellidos',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Nombres: '),
                                                  hintText: 'Nombres',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 3,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Codigo: '),
                                                  hintText: 'Codigo',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nombres',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Dias adicionales de vacaciones: '),
                                                  hintText: 'Dias adicionales de vacaciones',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Supervisor: '),
                                                  hintText: 'Supervisor',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Extras',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  fit: StackFit.passthrough,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Flexible(
                                              flex: 4,
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Periodo',
                                                      label: Text('Periodo'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Desde',
                                                      label: Text('Desde'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Hasta',
                                                      label: Text('Hasta'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Dias normales',
                                                      label: Text('Dias normales'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Dias adicionales',
                                                      label: Text('Dias adicionales'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Dias (ingresos)',
                                                      label: Text('Dias (ingresos)'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Egreso normal',
                                                      label: Text('Egreso normal'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Egreso adicional',
                                                      label: Text('Egreso adicional'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Dias (egresos)',
                                                      label: Text('Dias (egresos)'),
                                                      isDense: true,
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 8.0),
                                            Flexible(
                                              flex: 12,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 500,
                                                    child: SingleChildScrollView(
                                                      primary: false,
                                                      child: DataTable(
                                                        headingTextStyle:
                                                            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                        dataTextStyle: const TextStyle(fontSize: 16),
                                                        columnSpacing: 12,
                                                        columns: const [
                                                          DataColumn(label: Text('Periodo')),
                                                          DataColumn(label: Text('Desde')),
                                                          DataColumn(label: Text('Hasta')),
                                                          DataColumn(label: Text('Dias\ningresos'), numeric: true),
                                                          DataColumn(label: Text('Dias\ntomados'), numeric: true),
                                                          DataColumn(label: Text('Pagadas')),
                                                        ],
                                                        rows: const [
                                                          DataRow(
                                                            cells: [
                                                              DataCell(Text('001')),
                                                              DataCell(Text('00/00/00')),
                                                              DataCell(Text('00/00/00')),
                                                              DataCell(Text('11')),
                                                              DataCell(Text('12')),
                                                              DataCell(Text('-')),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  const Row(
                                                    children: [
                                                      Expanded(flex: 2, child: SizedBox()),
                                                      Flexible(
                                                        flex: 1,
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            label: Text('Saldo dias '),
                                                            hintText: 'Saldo dias',
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Flexible(
                                                        flex: 1,
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            label: Text('Saldo USD '),
                                                            hintText: 'Saldo USD',
                                                            isDense: true,
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Detalle de vacaciones ganadas y tomadas',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: 65,
                                      child: IconButton.filledTonal(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: 15,
                                      child: IconButton.filledTonal(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            //impuesto a la renta
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Apellidos: '),
                                                  hintText: 'Apellidos',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 5,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Nombres: '),
                                                  hintText: 'Nombres',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.0),
                                            Flexible(
                                              flex: 3,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  label: Text('Codigo: '),
                                                  hintText: 'Codigo',
                                                  isDense: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nombres',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0, top: 28, left: 12, right: 12),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 8),
                                            TextField(
                                              decoration: InputDecoration(
                                                label: Text('Lista de valores'),
                                                hintText: 'Lista de valores',
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            TextField(
                                              decoration: InputDecoration(
                                                label: Text('Area general'),
                                                hintText: 'Area general',
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            TextField(
                                              decoration: InputDecoration(
                                                label: Text('Fecha especial'),
                                                hintText: 'Fecha especial',
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            TextField(
                                              decoration: InputDecoration(
                                                label: Text('Valor 2'),
                                                hintText: 'Valor 2',
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            TextField(
                                              decoration: InputDecoration(
                                                label: Text('Personalizado 5'),
                                                hintText: 'Personalizado 5',
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            TextField(
                                              decoration: InputDecoration(
                                                label: Text('Personalizado 6'),
                                                hintText: 'Personalizado 6',
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      left: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Informacion adicional',
                                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: 15,
                                      child: Card(
                                        elevation: 15,
                                        child: IconButton(
                                          icon: const Icon(Icons.settings),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
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
  final bool selected;
  const Empleado({
    required this.identificacion,
    required this.nombres,
    required this.apellidos,
    required this.telCelular,
    required this.telConvencional,
    required this.correo,
    required this.direccion,
    required this.estado,
    this.selected = false,
  });

  Empleado copyWith({
    String? identificacion,
    String? nombres,
    String? apellidos,
    String? telCelular,
    String? telConvencional,
    String? correo,
    String? direccion,
    bool? estado,
    bool? selected,
  }) {
    return Empleado(
      identificacion: identificacion ?? this.identificacion,
      nombres: nombres ?? this.nombres,
      apellidos: apellidos ?? this.apellidos,
      telCelular: telCelular ?? this.telCelular,
      telConvencional: telConvencional ?? this.telConvencional,
      correo: correo ?? this.correo,
      direccion: direccion ?? this.direccion,
      estado: estado ?? this.estado,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identificacion': identificacion,
      'nombres': nombres,
      'apellidos': apellidos,
      'telCelular': telCelular,
      'telConvencional': telConvencional,
      'correo': correo,
      'direccion': direccion,
      'estado': estado,
      'selected': selected,
    };
  }

  factory Empleado.fromMap(Map<String, dynamic> map) {
    return Empleado(
      identificacion: map['identificacion'] as String,
      nombres: map['nombres'] as String,
      apellidos: map['apellidos'] as String,
      telCelular: map['telCelular'] as String,
      telConvencional: map['telConvencional'] as String,
      correo: map['correo'] as String,
      direccion: map['direccion'] as String,
      estado: map['estado'] as bool,
      selected: map['selected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Empleado.fromJson(String source) => Empleado.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Empleado(identificacion: $identificacion, nombres: $nombres, apellidos: $apellidos, telCelular: $telCelular, telConvencional: $telConvencional, correo: $correo, direccion: $direccion, estado: $estado, selected: $selected)';
  }

  @override
  bool operator ==(covariant Empleado other) {
    if (identical(this, other)) return true;

    return other.identificacion == identificacion &&
        other.nombres == nombres &&
        other.apellidos == apellidos &&
        other.telCelular == telCelular &&
        other.telConvencional == telConvencional &&
        other.correo == correo &&
        other.direccion == direccion &&
        other.estado == estado &&
        other.selected == selected;
  }

  @override
  int get hashCode {
    return identificacion.hashCode ^
        nombres.hashCode ^
        apellidos.hashCode ^
        telCelular.hashCode ^
        telConvencional.hashCode ^
        correo.hashCode ^
        direccion.hashCode ^
        estado.hashCode ^
        selected.hashCode;
  }
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
