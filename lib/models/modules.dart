import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'modules.freezed.dart';

@freezed
class Module with _$Module {
  const factory Module({
    required String label,
    required IconData icon,
    required IconData selectedIcon,
  }) = _Module;
}

@freezed
class Submodule with _$Submodule {
  const factory Submodule({
    required String moduleLabel,
    required String label,
    required Widget child,
  }) = _Submodule;
}
