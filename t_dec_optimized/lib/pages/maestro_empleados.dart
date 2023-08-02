import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_dec_optimized/constants/numeric.dart';
import 'package:t_dec_optimized/widgets/fm_leaf/fm_switch.dart';

import '../controllers/maestro_empleados_controller.dart';
import '../models/data_datatable.dart';
import '../models/layout_description.dart';
import '../widgets/fm2/fm2_layout.dart';
import '../widgets/fm3/fm3_stack_card.dart';
import '../widgets/fm_leaf/fm_data_table.dart';
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
                                  Text(empleados[i].telCelular),
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
                          CustomScrollView(
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(height: xxl),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: OnlyRow(children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Datos Basicos',
                                    child: Fm2Layout(
                                        layoutDescription: ColumnsInRow(children: [
                                      (
                                        1,
                                        [
                                          (const FmTextField(label: 'Cedula')),
                                          (const FmTextField(label: 'Fecha Nacimiento')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (const FmTextField(label: 'Cargo')),
                                          (const FmTextField(label: 'Cod. Ocupacional')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (const FmTextField(label: 'Codigo IESS')),
                                          (const FmSwitch(
                                              onChanged: null,
                                              primaryText: 'Estado',
                                              secondaryText: 'inactivo',
                                              value: true)),
                                        ]
                                      ),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Direccion',
                                    child: Fm2Layout(
                                        layoutDescription: ColumnsInRow(children: [
                                      (
                                        2,
                                        [
                                          (const FmTextField(label: 'Direccion 1')),
                                          (const FmTextField(label: 'Direccion 2')),
                                          (const FmTextField(label: 'Direccion 3')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (const FmTextField(label: 'Telefono 1')),
                                          (const FmTextField(label: 'Telefono 2')),
                                          (const FmTextField(label: 'Telefono 3')),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          (const FmTextField(label: 'Observaciones', maxLines: 5)),
                                        ]
                                      ),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm2Layout(
                                    layoutDescription: OnlyRow(children: [
                                  (
                                    11,
                                    Fm3StackCard(
                                        title: 'Enlaces',
                                        child: Fm2Layout(
                                            layoutDescription: OnlyColumn(children: [
                                          (const FmTextField(label: 'Departamento')),
                                          (const FmTextField(label: 'Cuenta contable')),
                                          (const FmTextField(label: 'Cuenta de costo')),
                                        ])))
                                  ),
                                  (
                                    5,
                                    Fm3StackCard(
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
                                    )
                                  )
                                ])),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(height: xxl),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: OnlyRow(children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Informacion del sueldo',
                                    child: Fm2Layout(
                                        layoutDescription: RowsInColumn(children: [
                                      [
                                        (1, const FmTextField(label: 'Sueldo Base')),
                                        (1, const SizedBox()),
                                        (1, const FmTextField(label: 'Tipo Contrato')),
                                      ],
                                      [
                                        (1, const FmTextField(label: 'Forma de pago D13')),
                                        (1, const FmTextField(label: 'Forma de pago D14')),
                                        (1, const FmTextField(label: 'Forma de pago FON')),
                                      ]
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Informacion de forma de pago proferida',
                                    child: Fm2Layout(
                                        layoutDescription: ColumnsInRow(children: [
                                      (
                                        2,
                                        [
                                          const FmTextField(label: 'Forma de pago'),
                                          const FmTextField(label: 'Hacia el blanco'),
                                          const FmTextField(label: 'Correo electronico'),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          const FmTextField(label: 'Cuenta Corriente'),
                                          const FmTextField(label: 'Cuenta Ahorros'),
                                          const FmTextField(label: 'Cuenta Virtual'),
                                        ]
                                      )
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                  child: Fm3StackCard(
                                      title: 'Informacion de forma de pago para el mes actual',
                                      child: Fm2Layout(
                                          layoutDescription: OnlyRow(
                                        children: [
                                          (1, const SizedBox()),
                                          (3, const FmTextField(label: 'Forma de pago para el mes actual.')),
                                          (1, const SizedBox()),
                                        ],
                                      )))),
                            ],
                          ),
                          CustomScrollView(
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(height: xl),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: OnlyRow(children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
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
                                        layoutDescription: ColumnsInRow(children: [
                                      (
                                        1,
                                        [
                                          const FmTextField(label: 'Estado Civil'),
                                          const FmTextField(label: 'Tipo de carga'),
                                          const FmTextField(label: 'Nombres'),
                                          const FmTextField(label: 'Fecha nacimiento'),
                                          const FmTextField(label: 'Edad'),
                                          const FmTextField(label: 'Genero'),
                                          const FmTextField(label: 'Otros datos', maxLines: 5),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          SingleChildScrollView(
                                            child: FmDataTable(
                                                data: DTData(header: [
                                              const DTHeader(label: 'Relacion'),
                                              const DTHeader(label: 'Nombres'),
                                              const DTHeader(label: 'Edad', numeric: true),
                                            ], rows: [
                                              const DTRow(cells: ['Hijo', 'Juan Perez', '12']),
                                              const DTRow(cells: ['Padre', 'Ibarra Velasco', '69']),
                                            ])),
                                          )
                                        ]
                                      ),
                                    ]))),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(height: xl),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: OnlyRow(children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm2Layout(
                                    layoutDescription: ColumnsInRow(children: [
                                  (
                                    2,
                                    [
                                      Fm3StackCard(
                                          title: 'Informacion del sueldo',
                                          child: Fm2Layout(
                                              layoutDescription: ColumnsInRow(children: [
                                            (
                                              1,
                                              [
                                                (const FmTextField(label: 'Ingresos Enero')),
                                                (const FmTextField(label: 'Ingresos Febrero')),
                                                (const FmTextField(label: 'Ingresos Marzo')),
                                                (const FmTextField(label: 'Ingresos Abril')),
                                                (const FmTextField(label: 'Ingresos Mayo')),
                                                (const FmTextField(label: 'Ingresos Junio')),
                                                (const FmTextField(label: 'Ingresos Julio')),
                                                (const FmTextField(label: 'Ingresos Agosto')),
                                                (const FmTextField(label: 'Ingresos Septiembre')),
                                                (const FmTextField(label: 'Ingresos Octubre')),
                                                (const FmTextField(label: 'Ingresos Noviembre')),
                                                (const FmTextField(label: 'Ingresos Diciembre')),
                                              ]
                                            ),
                                            (
                                              1,
                                              [
                                                (const FmTextField(label: 'Impuestos Enero')),
                                                (const FmTextField(label: 'Impuestos Febrero')),
                                                (const FmTextField(label: 'Impuestos Marzo')),
                                                (const FmTextField(label: 'Impuestos Abril')),
                                                (const FmTextField(label: 'Impuestos Mayo')),
                                                (const FmTextField(label: 'Impuestos Junio')),
                                                (const FmTextField(label: 'Impuestos Julio')),
                                                (const FmTextField(label: 'Impuestos Agosto')),
                                                (const FmTextField(label: 'Impuestos Septiembre')),
                                                (const FmTextField(label: 'Impuestos Octubre')),
                                                (const FmTextField(label: 'Impuestos Noviembre')),
                                                (const FmTextField(label: 'Impuestos Diciembre')),
                                              ]
                                            ),
                                          ]))),
                                    ]
                                  ),
                                  (
                                    1,
                                    [
                                      Fm3StackCard(
                                          title: 'Gastos Personales',
                                          child: Fm2Layout(
                                              layoutDescription: OnlyColumn(children: [
                                            (const FmTextField(label: 'Estimado anual')),
                                          ]))),
                                      Fm3StackCard(
                                          title: 'Otros Ingresos',
                                          child: Fm2Layout(
                                              layoutDescription: OnlyColumn(children: [
                                            (const FmTextField(label: 'Por utilidades')),
                                            (const FmTextField(label: 'Como sobresueldos')),
                                          ]))),
                                      Fm3StackCard(
                                          title: 'Por otros empleados',
                                          child: Fm2Layout(
                                              layoutDescription: OnlyColumn(children: [
                                            (const FmTextField(label: 'Ingresos')),
                                            (const FmTextField(label: 'Retenciones')),
                                          ]))),
                                      Fm3StackCard(
                                          title: 'RESUMEN',
                                          child: Fm2Layout(
                                              layoutDescription: OnlyColumn(children: [
                                            (const FmTextField(label: 'TOTAL INGRESOS')),
                                            (const FmTextField(label: 'TOTAL DESCUENTOS')),
                                          ]))),
                                    ]
                                  ),
                                ])),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(height: xl),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: OnlyRow(children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
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
                                        layoutDescription: ColumnsInRow(children: [
                                      (
                                        1,
                                        [
                                          FmSwitch(
                                              onChanged: (value) {},
                                              primaryText: 'Califica para fondo de reserva',
                                              value: true),
                                          const FmTextField(label: 'Entradas'),
                                          const FmTextField(label: 'Salidas'),
                                          const FmTextField(label: 'Notas', maxLines: 3),
                                        ]
                                      ),
                                      (
                                        1,
                                        [
                                          SingleChildScrollView(
                                            child: FmDataTable(
                                                data: DTData(header: [
                                              const DTHeader(label: 'Entradas'),
                                              const DTHeader(label: 'Salidas'),
                                              const DTHeader(label: 'Notas', numeric: true),
                                            ], rows: [
                                              const DTRow(cells: ['xyz', '', 'abc']),
                                              const DTRow(cells: ['', 'abc', 'xyz']),
                                            ])),
                                          )
                                        ]
                                      ),
                                    ]))),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(height: xl),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Nombres',
                                    child: Fm2Layout(
                                        layoutDescription: OnlyRow(children: [
                                      (2, const FmTextField(label: 'Apellidos')),
                                      (2, const FmTextField(label: 'Nombres')),
                                      (1, const FmTextField(label: 'Codigo')),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
                                    title: 'Extras',
                                    child: Fm2Layout(
                                        layoutDescription: OnlyRow(children: [
                                      (2, const FmTextField(label: 'Dias adicionales de vacaciones')),
                                      (2, const FmTextField(label: 'Supervision')),
                                    ]))),
                              ),
                              SliverToBoxAdapter(
                                child: Fm3StackCard(
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
                                        layoutDescription: ColumnsInRow(children: [
                                      (
                                        1,
                                        [
                                          const FmTextField(label: 'Periodo'),
                                          const FmTextField(label: 'Desde'),
                                          const FmTextField(label: 'Hasta'),
                                          const FmTextField(label: 'Dias normales'),
                                          const FmTextField(label: 'Dias adicionales'),
                                          const FmTextField(label: 'Dias (ingresos)'),
                                          const FmTextField(label: 'Egreso normal'),
                                          const FmTextField(label: 'Egreso adicional'),
                                          const FmTextField(label: 'Dias (egresos)'),
                                        ]
                                      ),
                                      (
                                        3,
                                        [
                                          SingleChildScrollView(
                                              child: FmDataTable(
                                                  data: DTData(header: [
                                            const DTHeader(label: 'Periodo'),
                                            const DTHeader(label: 'Desde'),
                                            const DTHeader(label: 'Hasta'),
                                            const DTHeader(label: 'Dias ing.', numeric: true),
                                            const DTHeader(label: 'Dias tomados', numeric: true),
                                            const DTHeader(label: 'Pagadas', numeric: true),
                                          ], rows: [
                                            const DTRow(cells: ['junio-23', '10-12-23', '10-12-23', '3', '3', '3']), 
                                          ]))
																							)
                                        ]
                                      ),
                                    ]))),
                              ),
                            ],
                          ),
                          CustomScrollView(slivers: [
                            const SliverToBoxAdapter(
                              child: SizedBox(height: xl),
                            ),
                            SliverToBoxAdapter(
                              child: Fm3StackCard(
                                  title: 'Nombres',
                                  child: Fm2Layout(
                                      layoutDescription: OnlyRow(children: [
                                    (2, const FmTextField(label: 'Apellidos')),
                                    (2, const FmTextField(label: 'Nombres')),
                                    (1, const FmTextField(label: 'Codigo')),
                                  ]))),
                            ),
                            SliverToBoxAdapter(
                              child: Fm3StackCard(
                                  title: 'Nombres',
                                  child: Fm2Layout(
                                      layoutDescription: OnlyColumn(children: [
                                    const FmTextField(label: 'Lista de Valores'),
                                    const FmTextField(label: 'Area general'),
                                    const FmTextField(label: 'Fecha especial'),
                                    const FmTextField(label: 'Valor 2'),
                                    const FmTextField(label: 'Personalizado 5'),
                                    const FmTextField(label: 'Personalizado 6'),
                                    const FmTextField(label: 'Personalizado 7'),
                                    const FmTextField(label: 'Personalizado 8'),
                                    const FmTextField(label: 'Personalizado 9'),
                                  ]))),
                            )
                          ]),
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
