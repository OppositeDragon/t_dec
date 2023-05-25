import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_dec/controllers/home_page/modules_controller.dart';
import 'package:t_dec/widgets/main_content.dart';

import '../widgets/navigation_rail_widget.dart';
import '../widgets/submodules_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDrawer = ref.watch(modulesControllerProvider.select((value) => value.showDrawer));
    return Scaffold(
      body: Row(
        children: [
          const NavigationRailWidget(),
          const VerticalDivider(thickness: 1, width: 1),
          if (showDrawer) const SubmodulesWidget(),
          const Expanded(child: MainContentWidget())
        ],
      ),
    );
  }
}
