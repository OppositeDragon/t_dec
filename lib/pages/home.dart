import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_dec/controllers/home_page/modules_controller.dart';
import 'package:t_dec/widgets/main_content.dart';

import '../widgets/submodules_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modulesProvider = ref.watch(modulesControllerProvider);
    return Scaffold(
      body: Row(
        children: [
          FocusTraversalGroup(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      selectedIndex: modulesProvider.selectedIndex,
                      onDestinationSelected: (int index) {
                        ref.read(modulesControllerProvider.notifier).setIndex(index);
                      },
                      labelType: NavigationRailLabelType.all,
                      destinations: <NavigationRailDestination>[
                        for (final module in modulesProvider.modules)
                          NavigationRailDestination(
                            icon: Icon(module.icon),
                            selectedIcon: Icon(module.selectedIcon),
                            label: Text(module.label),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (modulesProvider.showDrawer)
            const SubmodulesWidget(),
          Expanded(
            child: MainContentWidget()
          )
        ],
      ),
    );
  }
}
