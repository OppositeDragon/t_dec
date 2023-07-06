import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_dec_optimized/constants/numeric.dart';
import 'package:t_dec_optimized/widgets/fm_leaf/fm_switch.dart';

import '../constants/enums.dart';
import '../controllers/maestro_empleados_controller.dart';
import '../models/layout_description.dart';
import '../widgets/fm2/fm2_layout.dart';
import '../widgets/fm3/fm3_stack_card.dart';
import '../widgets/fm_leaf/fm_text_field.dart';

class MaestroEmpleadosPage extends ConsumerStatefulWidget {
  const MaestroEmpleadosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MaestraEmpleadosPageState();
}

class _MaestraEmpleadosPageState extends ConsumerState<MaestroEmpleadosPage> {
  bool soloInactivos = false;
  int page = 0;
  String identificacion = '';
  late final PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(keepPage: true, initialPage: page);
  }

  void animateToPage(int page) =>
      controller.animateToPage(page, duration: const Duration(milliseconds: 350), curve: Curves.ease);

  @override
  Widget build(BuildContext buildContext) {
    final empleados = ref.watch(empleadosControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return PageView(
      controller: controller,
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
                        title: soloInactivos ? const Text('todos') : const Text('inactivos'),
                        value: soloInactivos,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              soloInactivos = value!;
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
                                setState(() {
                                  empleados[i] = empleados[i].copyWith(selected: value ?? false);
                                });
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
                        page = 0;
                        animateToPage(page);
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
                        Tooltip(message: 'Informacion General', child: Tab(text: 'Informacion General')),
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
                                const SizedBox(height: xxl),
                                Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
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
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 5,
                                      child: Fm3StackCard(
                                          title: 'Enlaces',
                                          child: Fm2Layout(
                                              layoutDescription: SimpleLayout(layout: Layout.onlyColumn, children: [
                                            (2, const FmTextField(label: 'Departamento')),
                                            (2, const FmTextField(label: 'Cuenta contable')),
                                            (2, const FmTextField(label: 'Cuenta de costo')),
                                          ]))),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Fm3StackCard(
                                        title: 'Foto',
                                        actions: [
                                          IconButton.filled(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {},
                                          ),
                                          IconButton.filled(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {},
                                          ),
                                        ],
                                        child: const FlutterLogo(size: 200),
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
                                const SizedBox(height: xxl),
                                Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
                                    ]))),
                                Fm3StackCard(
                                    title: 'Informacion del sueldo',
                                    child: Fm2Layout(
                                        layoutDescription: ComplexLayout(layout: Layout.rowsInColumn, children: [
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Sueldo Base')),
                                          (1, const SizedBox()),
                                          (1, const FmTextField(label: 'Tipo Contrato')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Forma de pago D13')),
                                          (1, const FmTextField(label: 'Forma de pago D14')),
                                          (1, const FmTextField(label: 'Forma de pago FON')),
                                        ]
                                      )
                                    ]))),
                                Fm3StackCard(
                                    title: 'Informacion de forma de pago proferida',
                                    child: Fm2Layout(
                                        layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                      (
                                        2,
                                        [
                                          (1, const FmTextField(label: 'Forma de pago')),
                                          (1, const FmTextField(label: 'Hacia el blanco')),
                                          (1, const FmTextField(label: 'Correo electronico')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (1, const FmTextField(label: 'Cuenta Corriente')),
                                          (1, const FmTextField(label: 'Cuenta Ahorros')),
                                          (1, const FmTextField(label: 'Cuenta Virtual')),
                                        ]
                                      )
                                    ]))),
                                Fm3StackCard(
                                    title: 'Informacion de forma de pago para el mes actual',
                                    child: Fm2Layout(
                                        layoutDescription: SimpleLayout(
                                      layout: Layout.onlyRow,
                                      children: [
                                        (1, const SizedBox()),
                                        (3, const FmTextField(label: 'Forma de pago para el mes actual.')),
                                        (1, const SizedBox()),
                                      ],
                                    )))
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              const SizedBox(height: xl),
                              Fm3StackCard(
                                  title: 'Nombres',
                                  child: Fm2Layout(
                                      layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                    (2, const FmTextField(label: 'Apellidos')),
                                    (2, const FmTextField(label: 'Nombres')),
                                    (1, const FmTextField(label: 'Codigo')),
                                  ]))),
                              Fm3StackCard(
                                  title: 'Informacion del sueldo',
                                  actions: [
                                    IconButton.filled(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                    IconButton.filled(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                  ],
                                  child: Fm2Layout(
                                      layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                    (
                                      1,
                                      [
                                        (1, const FmTextField(label: 'Estado Civil')),
                                        (1, const FmTextField(label: 'Tipo de carga')),
                                        (1, const FmTextField(label: 'Nombres')),
                                        (1, const FmTextField(label: 'Fecha nacimiento')),
                                        (1, const FmTextField(label: 'Edad')),
                                        (1, const FmTextField(label: 'Genero')),
                                        (1, const FmTextField(label: 'Otros datos', maxLines: 5)),
                                      ]
                                    ),
                                    (
                                      1,
                                      [
                                        (
                                          1,
                                          SingleChildScrollView(
                                              child: DataTable(columns: const [
                                            DataColumn(label: Text('Relacion')),
                                            DataColumn(label: Text('Nombres')),
                                            DataColumn(label: Text('Edad'))
                                          ], rows: const [
                                            DataRow(cells: [
                                              DataCell(Text('Hijo')),
                                              DataCell(Text('Juan Perez')),
                                              DataCell(Text('12'))
                                            ])
                                          ]))
                                        )
                                      ]
                                    ),
                                  ]))),
                            ]),
                          ),
                          SingleChildScrollView(
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              const SizedBox(height: xl),
                              Fm3StackCard(
                                  title: 'Nombres',
                                  child: Fm2Layout(
                                      layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                    (2, const FmTextField(label: 'Apellidos')),
                                    (2, const FmTextField(label: 'Nombres')),
                                    (1, const FmTextField(label: 'Codigo')),
                                  ]))),
                              Fm2Layout(
                                  layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                (
                                  2,
                                  [
                                    (
                                      1,
                                      Fm3StackCard(
                                          title: 'Informacion del sueldo',
                                          child: Fm2Layout(
                                              layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                            (
                                              1,
                                              [
                                                (1, const FmTextField(label: 'Ingresos Enero')),
                                                (1, const FmTextField(label: 'Ingresos Febrero')),
                                                (1, const FmTextField(label: 'Ingresos Marzo')),
                                                (1, const FmTextField(label: 'Ingresos Abril')),
                                                (1, const FmTextField(label: 'Ingresos Mayo')),
                                                (1, const FmTextField(label: 'Ingresos Junio')),
                                                (1, const FmTextField(label: 'Ingresos Julio')),
                                                (1, const FmTextField(label: 'Ingresos Agosto')),
                                                (1, const FmTextField(label: 'Ingresos Septiembre')),
                                                (1, const FmTextField(label: 'Ingresos Octubre')),
                                                (1, const FmTextField(label: 'Ingresos Noviembre')),
                                                (1, const FmTextField(label: 'Ingresos Diciembre')),
                                              ]
                                            ),
                                            (
                                              1,
                                              [
                                                (1, const FmTextField(label: 'Impuestos Enero')),
                                                (1, const FmTextField(label: 'Impuestos Febrero')),
                                                (1, const FmTextField(label: 'Impuestos Marzo')),
                                                (1, const FmTextField(label: 'Impuestos Abril')),
                                                (1, const FmTextField(label: 'Impuestos Mayo')),
                                                (1, const FmTextField(label: 'Impuestos Junio')),
                                                (1, const FmTextField(label: 'Impuestos Julio')),
                                                (1, const FmTextField(label: 'Impuestos Agosto')),
                                                (1, const FmTextField(label: 'Impuestos Septiembre')),
                                                (1, const FmTextField(label: 'Impuestos Octubre')),
                                                (1, const FmTextField(label: 'Impuestos Noviembre')),
                                                (1, const FmTextField(label: 'Impuestos Diciembre')),
                                              ]
                                            ),
                                          ]))),
                                    ),
                                  ]
                                ),
                                (
                                  1,
                                  [
                                    (
                                      1,
                                      Fm3StackCard(
                                          title: 'Gastos Personales',
                                          child: Fm2Layout(
                                              layoutDescription: SimpleLayout(layout: Layout.onlyColumn, children: [
                                            (1, const FmTextField(label: 'Estimado anual')),
                                          ])))
                                    ),
                                    (
                                      1,
                                      Fm3StackCard(
                                          title: 'Otros Ingresos',
                                          child: Fm2Layout(
                                              layoutDescription: SimpleLayout(layout: Layout.onlyColumn, children: [
                                            (1, const FmTextField(label: 'Por utilidades')),
                                            (1, const FmTextField(label: 'Como sobresueldos')),
                                          ])))
                                    ),
                                    (
                                      1,
                                      Fm3StackCard(
                                          title: 'Por otros empleados',
                                          child: Fm2Layout(
                                              layoutDescription: SimpleLayout(layout: Layout.onlyColumn, children: [
                                            (1, const FmTextField(label: 'Ingresos')),
                                            (1, const FmTextField(label: 'Retenciones')),
                                          ])))
                                    ),
                                    (
                                      1,
                                      Fm3StackCard(
                                          title: 'RESUMEN',
                                          child: Fm2Layout(
                                              layoutDescription: SimpleLayout(layout: Layout.onlyColumn, children: [
                                            (1, const FmTextField(label: 'TOTAL INGRESOS')),
                                            (1, const FmTextField(label: 'TOTAL DESCUENTOS')),
                                          ])))
                                    ),
                                  ]
                                ),
                              ])),
                            ]),
                          ),
                          SingleChildScrollView(
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              const SizedBox(height: xl),
                              Fm3StackCard(
                                  title: 'Nombres',
                                  child: Fm2Layout(
                                      layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                    (2, const FmTextField(label: 'Apellidos')),
                                    (2, const FmTextField(label: 'Nombres')),
                                    (1, const FmTextField(label: 'Codigo')),
                                  ]))),
                              Fm3StackCard(
                                  title: 'Informacion del sueldo',
                                  actions: [
                                    IconButton.filled(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                    IconButton.filled(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                  ],
                                  child: Fm2Layout(
                                      layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                    (
                                      1,
                                      [
                                        (
                                          1,
                                          FmSwitch(
                                              onChanged: (value) {},
                                              primaryText: 'Califica para fondo de reserva',
                                              value: true)
                                        ),
                                        (1, const FmTextField(label: 'Entradas')),
                                        (1, const FmTextField(label: 'Salidas')),
                                        (1, const FmTextField(label: 'Notas', maxLines: 3)),
                                      ]
                                    ),
                                    (
                                      1,
                                      [
                                        (
                                          1,
                                          SingleChildScrollView(
                                              child: DataTable(columns: const [
                                            DataColumn(label: Text('Entradas')),
                                            DataColumn(label: Text('Salidas')),
                                            DataColumn(label: Text('Notas'))
                                          ], rows: const [
                                            DataRow(cells: [
                                              DataCell(Text('xyz	')),
                                              DataCell(Text('abc')),
                                              DataCell(Text('abc xyz'))
                                            ])
                                          ]))
                                        )
                                      ]
                                    ),
                                  ]))),
                            ]),
                          ),
                          SingleChildScrollView(
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              const SizedBox(height: xl),
                              Fm3StackCard(
                                  title: 'Nombres',
                                  child: Fm2Layout(
                                      layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                    (2, const FmTextField(label: 'Apellidos')),
                                    (2, const FmTextField(label: 'Nombres')),
                                    (1, const FmTextField(label: 'Codigo')),
                                  ]))),
                              Fm3StackCard(
                                  title: 'Extras',
                                  child: Fm2Layout(
                                      layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                    (2, const FmTextField(label: 'Dias adicionales de vacaciones')),
                                    (2, const FmTextField(label: 'Supervision')),
                                  ]))),
                              Fm3StackCard(
                                  title: 'Informacion del sueldo',
                                  actions: [
                                    IconButton.filled(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                    IconButton.filled(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                  ],
                                  child: Fm2Layout(
                                      layoutDescription: ComplexLayout(layout: Layout.columnsInRow, children: [
                                    (
                                      1,
                                      [
                                        (1, const FmTextField(label: 'Periodo')),
                                        (1, const FmTextField(label: 'Desde')),
                                        (1, const FmTextField(label: 'Hasta')),
                                        (1, const FmTextField(label: 'Dias normales')),
                                        (1, const FmTextField(label: 'Dias adicionales')),
                                        (1, const FmTextField(label: 'Dias (ingresos)')),
                                        (1, const FmTextField(label: 'Egreso normal')),
                                        (1, const FmTextField(label: 'Egreso adicional')),
                                        (1, const FmTextField(label: 'Dias (egresos)')),
                                      ]
                                    ),
                                    (
                                      3,
                                      [
                                        (
                                          1,
                                          SingleChildScrollView(
                                              child: DataTable(columns: const [
                                            DataColumn(label: Text('Periodo')),
                                            DataColumn(label: Text('Desde')),
                                            DataColumn(label: Text('Hasta')),
                                            DataColumn(label: Text('Dias Ingreso')),
                                            DataColumn(label: Text('Dias Tomados')),
                                            DataColumn(label: Text('Pagadas')),
                                          ], rows: const [
                                            DataRow(cells: [
                                              DataCell(Text('xyz	')),
                                              DataCell(Text('abc')),
                                              DataCell(Text('abc xyz')),
                                              DataCell(Text('abc xyz aoe')),
                                              DataCell(Text('abc xyz')),
                                              DataCell(Text('abc xyz')),
                                            ])
                                          ]))
                                        )
                                      ]
                                    ),
                                  ]))),
                            ]),
                          ),
                          SingleChildScrollView(
                              child: Column(mainAxisSize: MainAxisSize.min, children: [
                            const SizedBox(height: xl),
                            Fm3StackCard(
                                title: 'Nombres',
                                child: Fm2Layout(
                                    layoutDescription: SimpleLayout(layout: Layout.onlyRow, children: [
                                  (2, const FmTextField(label: 'Apellidos')),
                                  (2, const FmTextField(label: 'Nombres')),
                                  (1, const FmTextField(label: 'Codigo')),
                                ]))),
                            Fm3StackCard(
                                title: 'Nombres',
                                child: Fm2Layout(
                                    layoutDescription: SimpleLayout(layout: Layout.onlyColumn, children: [
                                  (2, const FmTextField(label: 'Lista de Valores')),
                                  (2, const FmTextField(label: 'Area general')),
                                  (1, const FmTextField(label: 'Fecha especial')),
                                  (1, const FmTextField(label: 'Valor 2')),
                                  (1, const FmTextField(label: 'Personalizado 5')),
                                  (1, const FmTextField(label: 'Personalizado 6')),
                                  (1, const FmTextField(label: 'Personalizado 7')),
                                  (1, const FmTextField(label: 'Personalizado 8')),
                                  (1, const FmTextField(label: 'Personalizado 9')),
                                ]))),
                          ])),
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
