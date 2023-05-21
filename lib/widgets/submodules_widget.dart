import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_page/modules_controller.dart';

class SubmodulesWidget extends ConsumerWidget {
  const SubmodulesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modulesState = ref.watch(submodulesControllerProvider);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      width: 220,
      child: FocusTraversalGroup(
        child: ListView.builder(
          itemCount: modulesState.submodules.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(modulesState.submodules.elementAt(index).label),
            onTap: () => ref.read(submodulesControllerProvider.notifier).activateSubmodule(index),
          ),
        ),
      ),
    );
  }
}
