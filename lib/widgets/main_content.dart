import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_dec/controllers/home_page/modules_controller.dart';

class MainContentWidget extends ConsumerStatefulWidget {
  const MainContentWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends ConsumerState<MainContentWidget> {
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
    final submodulesState = ref.watch(mainContentControllerProvider);
    final submodules = submodulesState.activeSubmodules;
    final activeIndex = submodulesState.activeSubmoduleIndex;
    return Column(
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
              onReorder: (oldIndex, newIndex) => ref.read(mainContentControllerProvider.notifier).reorderActiveSubmodules(oldIndex, newIndex),
              scrollController: _scrollController,
              buildDefaultDragHandles: false,
              scrollDirection: Axis.horizontal,
              // padding: const EdgeInsets.symmetric(horizontal: 40),
              itemCount: submodules.length,
              itemBuilder: (context, index) => ReorderableDragStartListener(
                key: Key('$index'),
                index: index,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () => ref.read(mainContentControllerProvider.notifier).setActiveIndex(index),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            index == activeIndex
                                ? Text(
                                    submodules.elementAt(index).label,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.secondary),
                                  )
                                : Text(submodules.elementAt(index).label),
                            const SizedBox(width: 20),
                            InkWell(
                                hoverColor: Theme.of(context).colorScheme.errorContainer,
                                onTap: () =>ref.read(mainContentControllerProvider.notifier).removeSubmodule(index),
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
          child: submodules.isEmpty
              ? const Center(child: Text('No hay pestanias abiertas'))
              : submodules.elementAt(activeIndex).child,
        )
      ],
    );
  }
}
