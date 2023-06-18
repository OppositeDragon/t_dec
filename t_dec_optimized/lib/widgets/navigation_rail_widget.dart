import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_page/modules_controller.dart';

class NavigationRailWidget extends ConsumerWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modulesProvider = ref.watch(modulesControllerProvider);
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: FocusTraversalGroup(
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
          ),
        );
      },
    );
  }
}