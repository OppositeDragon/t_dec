// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Module {
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  IconData get selectedIcon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModuleCopyWith<Module> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleCopyWith<$Res> {
  factory $ModuleCopyWith(Module value, $Res Function(Module) then) =
      _$ModuleCopyWithImpl<$Res, Module>;
  @useResult
  $Res call({String label, IconData icon, IconData selectedIcon});
}

/// @nodoc
class _$ModuleCopyWithImpl<$Res, $Val extends Module>
    implements $ModuleCopyWith<$Res> {
  _$ModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModuleCopyWith<$Res> implements $ModuleCopyWith<$Res> {
  factory _$$_ModuleCopyWith(_$_Module value, $Res Function(_$_Module) then) =
      __$$_ModuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, IconData icon, IconData selectedIcon});
}

/// @nodoc
class __$$_ModuleCopyWithImpl<$Res>
    extends _$ModuleCopyWithImpl<$Res, _$_Module>
    implements _$$_ModuleCopyWith<$Res> {
  __$$_ModuleCopyWithImpl(_$_Module _value, $Res Function(_$_Module) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = null,
  }) {
    return _then(_$_Module(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc

class _$_Module implements _Module {
  const _$_Module(
      {required this.label, required this.icon, required this.selectedIcon});

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final IconData selectedIcon;

  @override
  String toString() {
    return 'Module(label: $label, icon: $icon, selectedIcon: $selectedIcon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Module &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, icon, selectedIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModuleCopyWith<_$_Module> get copyWith =>
      __$$_ModuleCopyWithImpl<_$_Module>(this, _$identity);
}

abstract class _Module implements Module {
  const factory _Module(
      {required final String label,
      required final IconData icon,
      required final IconData selectedIcon}) = _$_Module;

  @override
  String get label;
  @override
  IconData get icon;
  @override
  IconData get selectedIcon;
  @override
  @JsonKey(ignore: true)
  _$$_ModuleCopyWith<_$_Module> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Submodule {
  String get moduleLabel => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Widget get child => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmoduleCopyWith<Submodule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmoduleCopyWith<$Res> {
  factory $SubmoduleCopyWith(Submodule value, $Res Function(Submodule) then) =
      _$SubmoduleCopyWithImpl<$Res, Submodule>;
  @useResult
  $Res call({String moduleLabel, String label, Widget child});
}

/// @nodoc
class _$SubmoduleCopyWithImpl<$Res, $Val extends Submodule>
    implements $SubmoduleCopyWith<$Res> {
  _$SubmoduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleLabel = null,
    Object? label = null,
    Object? child = null,
  }) {
    return _then(_value.copyWith(
      moduleLabel: null == moduleLabel
          ? _value.moduleLabel
          : moduleLabel // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmoduleCopyWith<$Res> implements $SubmoduleCopyWith<$Res> {
  factory _$$_SubmoduleCopyWith(
          _$_Submodule value, $Res Function(_$_Submodule) then) =
      __$$_SubmoduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String moduleLabel, String label, Widget child});
}

/// @nodoc
class __$$_SubmoduleCopyWithImpl<$Res>
    extends _$SubmoduleCopyWithImpl<$Res, _$_Submodule>
    implements _$$_SubmoduleCopyWith<$Res> {
  __$$_SubmoduleCopyWithImpl(
      _$_Submodule _value, $Res Function(_$_Submodule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleLabel = null,
    Object? label = null,
    Object? child = null,
  }) {
    return _then(_$_Submodule(
      moduleLabel: null == moduleLabel
          ? _value.moduleLabel
          : moduleLabel // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_Submodule implements _Submodule {
  const _$_Submodule(
      {required this.moduleLabel, required this.label, required this.child});

  @override
  final String moduleLabel;
  @override
  final String label;
  @override
  final Widget child;

  @override
  String toString() {
    return 'Submodule(moduleLabel: $moduleLabel, label: $label, child: $child)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Submodule &&
            (identical(other.moduleLabel, moduleLabel) ||
                other.moduleLabel == moduleLabel) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(runtimeType, moduleLabel, label, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmoduleCopyWith<_$_Submodule> get copyWith =>
      __$$_SubmoduleCopyWithImpl<_$_Submodule>(this, _$identity);
}

abstract class _Submodule implements Submodule {
  const factory _Submodule(
      {required final String moduleLabel,
      required final String label,
      required final Widget child}) = _$_Submodule;

  @override
  String get moduleLabel;
  @override
  String get label;
  @override
  Widget get child;
  @override
  @JsonKey(ignore: true)
  _$$_SubmoduleCopyWith<_$_Submodule> get copyWith =>
      throw _privateConstructorUsedError;
}
