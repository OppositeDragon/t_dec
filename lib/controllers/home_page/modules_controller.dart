import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/home_setup.dart';
import '../../models/modules.dart';

part 'modules_controller.freezed.dart';
part 'modules_controller.g.dart';

@riverpod
Set<Module> modules(ModulesRef ref) {
  return modulesSet;
}

@riverpod
Set<Submodule> submodules(SubmodulesRef ref) {
  return submodulesSet;
}

@riverpod
class ModulesController extends _$ModulesController {
  @override
  ModulesState build() {
    return ModulesState(
      modules: ref.watch(modulesProvider),
    );
  }

  void setIndex(int index) {
    if (state.selectedIndex == index) {
      state = state.copyWith(showDrawer: !state.showDrawer);
    } else {
      state = state.copyWith(selectedIndex: index, showDrawer: true);
    }
  }
}

@riverpod
class SubmodulesController extends _$SubmodulesController {
  @override
  SubmodulesState build() {
    final submodules = ref.watch(submodulesProvider);
    final modulesState = ref.watch(modulesControllerProvider);
    final index = modulesState.selectedIndex;
    return SubmodulesState(
      submodules: {
        for (final submodule in submodules)
          if (submodule.moduleLabel == modulesState.modules.elementAt(index).label) submodule
      },
    );
  }

  void activateSubmodule(int index) {
    ref.read(mainContentControllerProvider.notifier).activateSubmodule(state.submodules.elementAt(index));
  }
}

@riverpod
class MainContentController extends _$MainContentController {
  @override
  MainContentState build() {
    return const MainContentState();
  }

  void activateSubmodule(Submodule submodule) {
    final alreadyExists = state.activeSubmodules.contains(submodule);
    if (!alreadyExists) {
      state = state.copyWith(activeSubmodules: state.activeSubmodules.union({submodule}));
    }
    state = state.copyWith(activeSubmoduleIndex: state.activeSubmodules.toList().indexOf(submodule));
  }

  void setActiveIndex(int index) {
    state = state.copyWith(activeSubmoduleIndex: index);
  }

  void reorderActiveSubmodules(int oldIndex, int newIndex) {
    final submodules = state.activeSubmodules.toList();
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = submodules.removeAt(oldIndex);
    submodules.insert(newIndex, item);
    state = state.copyWith(activeSubmodules: submodules.toSet(), activeSubmoduleIndex: newIndex);
  }

  void removeSubmodule(int index) {
    final submoduleToRemove = state.activeSubmodules.elementAt(index);
    state = state.copyWith(
      activeSubmoduleIndex:
          index < state.activeSubmoduleIndex ? state.activeSubmoduleIndex - 1 : state.activeSubmoduleIndex,
      activeSubmodules: {
        for (final sm in state.activeSubmodules)
          if (sm != submoduleToRemove) sm
      },
    );
  }
}

@freezed
class ModulesState with _$ModulesState {
  const factory ModulesState({
    required Set<Module> modules,
    @Default(0) int selectedIndex,
    @Default(true) bool showDrawer,
  }) = _ModulesState;
}

@freezed
class SubmodulesState with _$SubmodulesState {
  const factory SubmodulesState({
    @Default({}) Set<Submodule> submodules,
  }) = _SubmodulesState;
}

@freezed
class MainContentState with _$MainContentState {
  const factory MainContentState({
    @Default({}) Set<Submodule> activeSubmodules,
    @Default(0) int activeSubmoduleIndex,
  }) = _MainContentState;
}
