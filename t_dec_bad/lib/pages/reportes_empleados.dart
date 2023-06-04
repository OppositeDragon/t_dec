import 'package:flutter/material.dart';

class ReportesEmpleadosPage extends StatefulWidget {
  const ReportesEmpleadosPage({super.key});

  @override
  State<ReportesEmpleadosPage> createState() => _ReportesEmpleadosPageState();
}

class _ReportesEmpleadosPageState extends State<ReportesEmpleadosPage> {
  var selectedTipoImpresion = TiposImpresion.inPlace;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return CustomScrollView(slivers: [
      SliverPadding(
        padding: const EdgeInsets.all(12),
        sliver: SliverToBoxAdapter(
          child: Text('Maestro Empleados', style: textTheme.displaySmall),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(12),
        sliver: SliverToBoxAdapter(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0, top: 24, left: 12, right: 12),
                        child: Column(
                          children: [
														const SizedBox(height: 8),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                hintText: 'Tipo Reporte',
                                label: Text('Tipo Reporte'),
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                              isDense: true,
                              value: null,
                              items: null,
                              onChanged: (item) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                hintText: 'Departamento',
                                label: Text('Departamento'),
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                              isDense: true,
                              value: null,
                              items: null,
                              onChanged: (item) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                hintText: 'Empleado',
                                label: Text('Empleado'),
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                              isDense: true,
                              value: null,
                              items: null,
                              onChanged: (item) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              children: [
                                Text('Entre las fechas: '),
                                SizedBox(width: 16.0),
                                Flexible(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'aaaa-mm-dd',
                                      label: Text('Fecha inicio'),
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
                                      hintText: 'aaaa-mm-dd',
                                      label: Text('Fecha fin'),
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ToggleButtons(
                              onPressed: (int index) {
                                setState(() {
                                  estados = [
                                    for (int i = 0; i < estados.length; i++)
                                      if (i == index) (estados[i].$1, state: true) else (estados[i].$1, state: false)
                                  ];
                                });
                              },
                              isSelected: estados.map((e) => e.state).toList(),
                              borderRadius: BorderRadius.circular(4),
                              children: [
                                for (var estado in estados)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(estado.$1),
                                  )
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
                            'Criterios de seleccion',
                            style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
									mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                    	clipBehavior: Clip.none,
                    	children: [
                    		Card(
                    			child: Padding(
                    				padding: const EdgeInsets.only(bottom: 16.0, top: 32, left: 12, right: 12),
                    				child: DropdownButtonFormField(
                    								decoration: const InputDecoration(
                    									hintText: 'Ningun reporte rapido',
                    									label: Text('Ningun reporte rapido'),
                    									isDense: true,
                    									border: OutlineInputBorder(),
                    								),
                    								isDense: true,
                    								value: selectedTipoImpresion,
                    								items: null,
                    								onChanged: (TiposImpresion? item) {
                    									setState(() {
                    										if (item != null) {
                    											selectedTipoImpresion = item;
                    										}
                    									});
                    								}),
                    						
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
                    						'Reportes rapidos',
                    						style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    					),
                    				),
                    			),
                    		),
                    	],
                    ),
										const SizedBox(height: 16),
                   Stack(
                   	clipBehavior: Clip.none,
                   	children: [
                   		Card(
                   			child: Padding(
                   				padding: const EdgeInsets.only(bottom: 16.0, top: 32, left: 12, right: 12),
                   				child: Column(
                   					children: [
                   						const SizedBox(height: 8),
                   						DropdownButtonFormField(
                   								decoration: const InputDecoration(
                   									hintText: 'Tipo Impresion',
                   									label: Text('Tipo Impresion'),
                   									isDense: true,
                   									border: OutlineInputBorder(),
                   								),
                   								isDense: true,
                   								value: selectedTipoImpresion,
                   								items: <DropdownMenuItem<TiposImpresion>>[
                   									for (int i = 0; i < TiposImpresion.values.length; i++)
                   										DropdownMenuItem(
                   												value: TiposImpresion.values[i], child: Text(TiposImpresion.values[i].label))
                   								],
                   								onChanged: (TiposImpresion? item) {
                   									setState(() {
                   										if (item != null) {
                   											selectedTipoImpresion = item;
                   										}
                   									});
                   								}),
                   						const SizedBox(height: 12),
                   						FilledButton.tonal(
                   							onPressed: () {},
                   							child: const Text('Generar Reporte'),
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
                   						'Salida',
                   						style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
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
        ),
      )
    ]);
  }
}

enum TiposImpresion {
  inPlace('En Pantalla'),
  printer('Imprimir'),
  excel('Exportar Excel'),
  pdf('Exportar PDF');

  const TiposImpresion(this.label);
  final String label;
}

typedef Estado = (String, {bool state});
var estados = <Estado>[
  ('Activos', state: false),
  ('Inactivos', state: false),
  ('Todos', state: true),
];
