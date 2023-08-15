// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modules_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$modulesHash() => r'cec5ee496553a9e0beebe4b90341209015a00fed';

/// See also [modules].
@ProviderFor(modules)
final modulesProvider = AutoDisposeProvider<Set<Module>>.internal(
  modules,
  name: r'modulesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$modulesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ModulesRef = AutoDisposeProviderRef<Set<Module>>;
String _$submodulesHash() => r'16e5a2e8fc1311141c3661b285afe45f32d2b291';

/// See also [submodules].
@ProviderFor(submodules)
final submodulesProvider = AutoDisposeProvider<Set<Submodule>>.internal(
  submodules,
  name: r'submodulesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$submodulesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubmodulesRef = AutoDisposeProviderRef<Set<Submodule>>;
String _$modulesControllerHash() => r'3c0f44ee80c66f1091f1d4c7a418f283d02068d3';

/// See also [ModulesController].
@ProviderFor(ModulesController)
final modulesControllerProvider =
    AutoDisposeNotifierProvider<ModulesController, ModulesState>.internal(
  ModulesController.new,
  name: r'modulesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$modulesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ModulesController = AutoDisposeNotifier<ModulesState>;
String _$submodulesControllerHash() =>
    r'fd295d328e5215db87bc91541979adb71910da2d';

/// See also [SubmodulesController].
@ProviderFor(SubmodulesController)
final submodulesControllerProvider =
    AutoDisposeNotifierProvider<SubmodulesController, SubmodulesState>.internal(
  SubmodulesController.new,
  name: r'submodulesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$submodulesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SubmodulesController = AutoDisposeNotifier<SubmodulesState>;
String _$mainContentControllerHash() =>
    r'5c0c901b7216661c0782c87ada778bcdc0142bde';

/// See also [MainContentController].
@ProviderFor(MainContentController)
final mainContentControllerProvider = AutoDisposeNotifierProvider<
    MainContentController, MainContentState>.internal(
  MainContentController.new,
  name: r'mainContentControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mainContentControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainContentController = AutoDisposeNotifier<MainContentState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
