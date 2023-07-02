import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_dec_optimized/widgets/fm_leaf/fm_switch.dart';

import '../constants/enums.dart';
import '../models/layout_description.dart';
import '../widgets/fm2/fm2_layout.dart';
import '../widgets/fm3/fm3_stack_card.dart';
import '../widgets/fm_leaf/fm_text_field.dart';

class MaestroEmpleadosPage extends ConsumerWidget {
  const MaestroEmpleadosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return PageView(
      // controller: _controller,
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
                    // setState(
                    //   () {
                    //     _page = 0;
                    //     animateToPage(_page);
                    //   },
                    // );
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
                                Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (2, const FmTextField(label: 'Codigo')),
                                    ]))),
                                Fm3StackCard(
                                    title: 'Datos Basicos',
                                    child: Fm2Layout(
                                        layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Cedula')),
                                          (1, const FmTextField(label: 'Fecha Nacimiento')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Cargo')),
                                          (1, const FmTextField(label: 'Cod. Ocupacional')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Codigo IESS')),
                                          (
                                            1,
                                            const FmSwitch(
                                                onChanged: null,
                                                primaryText: 'Estado',
                                                secondaryText: 'inacttivo',
                                                value: true)
                                          ),
                                        ]
                                      ),
                                    ]))),
                                Fm3StackCard(
                                    title: 'Direccion',
                                    child: Fm2Layout(
                                        layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                      (
                                        2,
                                        [
                                          (1, const FmTextField(label: 'Direccion 1')),
                                          (1, const FmTextField(label: 'Direccion 2')),
                                          (1, const FmTextField(label: 'Direccion 3')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Telefono 1')),
                                          (1, const FmTextField(label: 'Telefono 2')),
                                          (1, const FmTextField(label: 'Telefono 3')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Observaciones', maxLines: 5)),
                                        ]
                                      ),
                                    ]))),
                                Fm3StackCard(
                                    title: 'Enlaces',
                                    child: Fm2Layout(
                                        layoutDescription: SimpleLayout(layout: Layout.onlyColumn, children: [
                                      (2, const FmTextField(label: 'Departamento')),
                                      (2, const FmTextField(label: 'Cuenta contable')),
                                      (2, const FmTextField(label: 'Cuenta de costo')),
                                    ]))),
                                Fm3StackCard(
                                  title: 'Foto',
                                  actions: [
                                    IconButton.filledTonal(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                    IconButton.filledTonal(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                  ],
                                  child: const FlutterLogo(size: 100),
                                ),
                              ],
                            ),
                          ),
                          const SingleChildScrollView(child: Column(children: [
														
													],)),
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
