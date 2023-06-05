import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:t_dec_bad/pages/maestro_empleados.dart';
import 'package:t_dec_bad/pages/reportes_empleados.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _showDrawer = true;
  int _railIndex = 0;

  Set<Submodule> activeSubmodules = {};
  int _activeSubmoduleIndex = 0;
  Set<Submodule> submodulesInDrawer = {};

  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    submodulesInDrawer =
        submodulesSet.where((element) => element.moduleLabel == modulesSet.elementAt(_railIndex).label).toSet();
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF00677C),
            onPrimary: Color(0xFFFFFFFF),
            primaryContainer: Color(0xFFB1EBFF),
            onPrimaryContainer: Color(0xFF001F27),
            secondary: Color(0xFF2E5DA8),
            onSecondary: Color(0xFFFFFFFF),
            secondaryContainer: Color(0xFFD7E2FF),
            onSecondaryContainer: Color(0xFF001A40),
            tertiary: Color(0xFF00696C),
            onTertiary: Color(0xFFFFFFFF),
            tertiaryContainer: Color(0xFF6FF6FA),
            onTertiaryContainer: Color(0xFF002021),
            error: Color(0xFFBA1A1A),
            errorContainer: Color(0xFFFFDAD6),
            onError: Color(0xFFFFFFFF),
            onErrorContainer: Color(0xFF410002),
            background: Color(0xFFFBFCFE),
            onBackground: Color(0xFF191C1D),
            surface: Color(0xFFFBFCFE),
            onSurface: Color(0xFF191C1D),
            surfaceVariant: Color(0xFFDBE4E8),
            onSurfaceVariant: Color(0xFF40484B),
            outline: Color(0xFF70787C),
            onInverseSurface: Color(0xFFEFF1F2),
            inverseSurface: Color(0xFF2E3132),
            inversePrimary: Color(0xFF58D6F7),
            shadow: Color(0xFF000000),
            surfaceTint: Color(0xFF00677C),
            outlineVariant: Color(0xFFBFC8CC),
            scrim: Color(0xFF000000),
          )),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF58D6F7),
          onPrimary: Color(0xFF003642),
          primaryContainer: Color(0xFF004E5E),
          onPrimaryContainer: Color(0xFFB1EBFF),
          secondary: Color(0xFFACC7FF),
          onSecondary: Color(0xFF002F67),
          secondaryContainer: Color(0xFF07458E),
          onSecondaryContainer: Color(0xFFD7E2FF),
          tertiary: Color(0xFF4CDADD),
          onTertiary: Color(0xFF003738),
          tertiaryContainer: Color(0xFF004F51),
          onTertiaryContainer: Color(0xFF6FF6FA),
          error: Color(0xFFFFB4AB),
          errorContainer: Color(0xFF93000A),
          onError: Color(0xFF690005),
          onErrorContainer: Color(0xFFFFDAD6),
          background: Color(0xFF191C1D),
          onBackground: Color(0xFFE1E3E4),
          surface: Color(0xFF191C1D),
          onSurface: Color(0xFFE1E3E4),
          surfaceVariant: Color(0xFF40484B),
          onSurfaceVariant: Color(0xFFBFC8CC),
          outline: Color(0xFF899296),
          onInverseSurface: Color(0xFF191C1D),
          inverseSurface: Color(0xFFE1E3E4),
          inversePrimary: Color(0xFF00677C),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF58D6F7),
          outlineVariant: Color(0xFF40484B),
          scrim: Color(0xFF000000),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: Row(
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: FocusTraversalGroup(
                        child: NavigationRail(
                          selectedIndex: _railIndex,
                          onDestinationSelected: (int index) {
                            setState(() {
                              if (_railIndex == index) {
                                _showDrawer = !_showDrawer;
                                return;
                              }
                              _showDrawer = true;
                              _railIndex = index;
                            });
                          },
                          labelType: NavigationRailLabelType.all,
                          destinations: <NavigationRailDestination>[
                            for (final module in modulesSet)
                              NavigationRailDestination(
                                icon: Icon(module.icon),
                                selectedIcon: Icon(module.selectedIcon),
                                label: Text(module.label),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            if (_showDrawer) const VerticalDivider(thickness: 1, width: 1),
            if (_showDrawer)
              Drawer(
                elevation: 0,
                width: 220,
                child: FocusTraversalGroup(
                  child: ListView.builder(
                    itemCount: submodulesInDrawer.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(submodulesInDrawer.elementAt(index).label),
                      onTap: () {
                        setState(() {
                          if (!activeSubmodules.contains(submodulesInDrawer.elementAt(index))) {
                            activeSubmodules.add(submodulesInDrawer.elementAt(index));
                          }
                          _activeSubmoduleIndex =
                              activeSubmodules.toList().indexOf(submodulesInDrawer.elementAt(index));
                        });
                      },
                    ),
                  ),
                ),
              ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Listener(
                      onPointerSignal: (event) {
                        if (event is PointerScrollEvent) {
                          final offset = event.scrollDelta.dy;
                          _scrollController.jumpTo(_scrollController.offset + offset * 2);
                        }
                      },
                      child: ReorderableListView.builder(
                        onReorder: (oldIndex, newIndex) {
                          final submodules = activeSubmodules.toList();
                          if (oldIndex < newIndex) newIndex -= 1;
                          final item = submodules.removeAt(oldIndex);
                          submodules.insert(newIndex, item);
                          _activeSubmoduleIndex = newIndex;
                        },
                        scrollController: _scrollController,
                        buildDefaultDragHandles: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: activeSubmodules.length,
                        itemBuilder: (context, index) => ReorderableDragStartListener(
                          key: Key('$index'),
                          index: index,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(8)),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _activeSubmoduleIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      index == _activeSubmoduleIndex
                                          ? Text(
                                              activeSubmodules.elementAt(index).label,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Theme.of(context).colorScheme.secondary),
                                            )
                                          : Text(activeSubmodules.elementAt(index).label),
                                      const SizedBox(width: 20),
                                      InkWell(
                                          hoverColor: Theme.of(context).colorScheme.errorContainer,
                                          onTap: () {
                                            setState(() {
                                              activeSubmodules.remove(activeSubmodules.elementAt(index));
                                              _activeSubmoduleIndex = index <= _activeSubmoduleIndex
                                                  ? _activeSubmoduleIndex - 1
                                                  : _activeSubmoduleIndex;
                                              if (_activeSubmoduleIndex < 0) _activeSubmoduleIndex = 0;
                                            });
                                          },
                                          child: const Icon(Icons.close)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Expanded(
                    child: activeSubmodules.isEmpty
                        ? const Center(child: Text('No hay pestanias abiertas'))
                        : activeSubmodules.elementAt(_activeSubmoduleIndex).child,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final Set<Module> modulesSet = {
  Module(label: 'Empleados', icon: Icons.badge_outlined, selectedIcon: Icons.badge),
  Module(label: 'Usuarios', icon: Icons.person_outline, selectedIcon: Icons.person),
  Module(label: 'Cuentas', icon: Icons.account_balance_outlined, selectedIcon: Icons.account_balance),
  Module(label: 'Documentos', icon: Icons.document_scanner_outlined, selectedIcon: Icons.document_scanner),
};

final Set<Submodule> submodulesSet = {
  Submodule(moduleLabel: 'Empleados', label: 'Maestro', child: const MaestroEmpleadosPage()),
  Submodule(moduleLabel: 'Empleados', label: 'Reportes', child: const ReportesEmpleadosPage()),
  Submodule(moduleLabel: 'Usuarios', label: 'Listar', child: const Text('Listar usuarios')),
  Submodule(moduleLabel: 'Usuarios', label: 'Crear', child: const Text('Crear usuarios')),
  Submodule(moduleLabel: 'Usuarios', label: 'Editar Permisos', child: const Text('Editar permisos')),
  Submodule(moduleLabel: 'Cuentas', label: 'Listar', child: const Text('Listar cuentas')),
  Submodule(moduleLabel: 'Cuentas', label: 'Crear', child: const Text('Crear cuentas')),
  Submodule(moduleLabel: 'Cuentas', label: 'Editar', child: const Text('Editar cuentas')),
  Submodule(moduleLabel: 'Documentos', label: 'Listar', child: const Text('Listar documentos')),
  Submodule(moduleLabel: 'Documentos', label: 'Crear', child: const Text('Crear documentos')),
  Submodule(moduleLabel: 'Documentos', label: 'Editar', child: const Text('Editar documentos')),
};

class Module {
  String label;
  IconData icon;
  IconData selectedIcon;
  Module({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });
}

class Submodule {
  String moduleLabel;
  String label;
  Widget child;
  Submodule({
    required this.moduleLabel,
    required this.label,
    required this.child,
  });
}
