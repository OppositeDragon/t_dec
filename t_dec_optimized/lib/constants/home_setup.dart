import 'package:flutter/material.dart';
import 'package:t_dec_optimized/models/data_datatable.dart';
import 'package:t_dec_optimized/widgets/fm_leaf/fm_data_table.dart';

import '../models/modules.dart';
import '../pages/maestro_empleados.dart';

final Set<Module> modulesSet = {
  const Module(label: 'Empleados', icon: Icons.badge_outlined, selectedIcon: Icons.badge),
  const Module(label: 'Usuarios', icon: Icons.person_outline, selectedIcon: Icons.person),
  const Module(label: 'Cuentas', icon: Icons.account_balance_outlined, selectedIcon: Icons.account_balance),
  const Module(label: 'Documentos', icon: Icons.document_scanner_outlined, selectedIcon: Icons.document_scanner),
};

final Set<Submodule> submodulesSet = {
  const Submodule(moduleLabel: 'Empleados', label: 'Maestro', child: MaestroEmpleadosPage()),
  //Submodule(moduleLabel: 'Empleados', label: 'Reportes', child: const ReportesEmpleadosPage()),
  Submodule(
    moduleLabel: 'Usuarios',
    label: 'Listar',
    child: FmDataTable(
        data: DTData(header: [
      const DTHeader(label: 'one'),
      const DTHeader(label: 'two'),
      const DTHeader(label: 'three', numeric: true),
    ], rows: [
      const DTRow(cells: ['1', '2', '3']),
      const DTRow(cells: ['4', '5', '6']),
      const DTRow(cells: ['7', '8', '9']),
    ])),
  ),
  const Submodule(moduleLabel: 'Usuarios', label: 'Crear', child: Text('Crear usuarios')),
  const Submodule(moduleLabel: 'Usuarios', label: 'Editar Permisos', child: Text('Editar permisos')),
  const Submodule(moduleLabel: 'Cuentas', label: 'Listar', child: Text('Listar cuentas')),
  const Submodule(moduleLabel: 'Cuentas', label: 'Crear', child: Text('Crear cuentas')),
  const Submodule(moduleLabel: 'Cuentas', label: 'Editar', child: Text('Editar cuentas')),
  const Submodule(moduleLabel: 'Documentos', label: 'Listar', child: Text('Listar documentos')),
  const Submodule(moduleLabel: 'Documentos', label: 'Crear', child: Text('Crear documentos')),
  const Submodule(moduleLabel: 'Documentos', label: 'Editar', child: Text('Editar documentos')),
};
