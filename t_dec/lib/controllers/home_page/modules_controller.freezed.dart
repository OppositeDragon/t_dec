// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modules_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModulesState {
  Set<Module> get modules => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get showDrawer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModulesStateCopyWith<ModulesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModulesStateCopyWith<$Res> {
  factory $ModulesStateCopyWith(
          ModulesState value, $Res Function(ModulesState) then) =
      _$ModulesStateCopyWithImpl<$Res, ModulesState>;
  @useResult
  $Res call({Set<Module> modules, int selectedIndex, bool showDrawer});
}

/// @nodoc
class _$ModulesStateCopyWithImpl<$Res, $Val extends ModulesState>
    implements $ModulesStateCopyWith<$Res> {
  _$ModulesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modules = null,
    Object? selectedIndex = null,
    Object? showDrawer = null,
  }) {
    return _then(_value.copyWith(
      modules: null == modules
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as Set<Module>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showDrawer: null == showDrawer
          ? _value.showDrawer
          : showDrawer // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModulesStateCopyWith<$Res>
    implements $ModulesStateCopyWith<$Res> {
  factory _$$_ModulesStateCopyWith(
          _$_ModulesState value, $Res Function(_$_ModulesState) then) =
      __$$_ModulesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<Module> modules, int selectedIndex, bool showDrawer});
}

/// @nodoc
class __$$_ModulesStateCopyWithImpl<$Res>
    extends _$ModulesStateCopyWithImpl<$Res, _$_ModulesState>
    implements _$$_ModulesStateCopyWith<$Res> {
  __$$_ModulesStateCopyWithImpl(
      _$_ModulesState _value, $Res Function(_$_ModulesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modules = null,
    Object? selectedIndex = null,
    Object? showDrawer = null,
  }) {
    return _then(_$_ModulesState(
      modules: null == modules
          ? _value._modules
          : modules // ignore: cast_nullable_to_non_nullable
              as Set<Module>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showDrawer: null == showDrawer
          ? _value.showDrawer
          : showDrawer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ModulesState implements _ModulesState {
  const _$_ModulesState(
      {required final Set<Module> modules,
      this.selectedIndex = 0,
      this.showDrawer = true})
      : _modules = modules;

  final Set<Module> _modules;
  @override
  Set<Module> get modules {
    if (_modules is EqualUnmodifiableSetView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_modules);
  }

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final bool showDrawer;

  @override
  String toString() {
    return 'ModulesState(modules: $modules, selectedIndex: $selectedIndex, showDrawer: $showDrawer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModulesState &&
            const DeepCollectionEquality().equals(other._modules, _modules) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.showDrawer, showDrawer) ||
                other.showDrawer == showDrawer));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_modules), selectedIndex, showDrawer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModulesStateCopyWith<_$_ModulesState> get copyWith =>
      __$$_ModulesStateCopyWithImpl<_$_ModulesState>(this, _$identity);
}

abstract class _ModulesState implements ModulesState {
  const factory _ModulesState(
      {required final Set<Module> modules,
      final int selectedIndex,
      final bool showDrawer}) = _$_ModulesState;

  @override
  Set<Module> get modules;
  @override
  int get selectedIndex;
  @override
  bool get showDrawer;
  @override
  @JsonKey(ignore: true)
  _$$_ModulesStateCopyWith<_$_ModulesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubmodulesState {
  Set<Submodule> get submodules => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmodulesStateCopyWith<SubmodulesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmodulesStateCopyWith<$Res> {
  factory $SubmodulesStateCopyWith(
          SubmodulesState value, $Res Function(SubmodulesState) then) =
      _$SubmodulesStateCopyWithImpl<$Res, SubmodulesState>;
  @useResult
  $Res call({Set<Submodule> submodules});
}

/// @nodoc
class _$SubmodulesStateCopyWithImpl<$Res, $Val extends SubmodulesState>
    implements $SubmodulesStateCopyWith<$Res> {
  _$SubmodulesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submodules = null,
  }) {
    return _then(_value.copyWith(
      submodules: null == submodules
          ? _value.submodules
          : submodules // ignore: cast_nullable_to_non_nullable
              as Set<Submodule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmodulesStateCopyWith<$Res>
    implements $SubmodulesStateCopyWith<$Res> {
  factory _$$_SubmodulesStateCopyWith(
          _$_SubmodulesState value, $Res Function(_$_SubmodulesState) then) =
      __$$_SubmodulesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<Submodule> submodules});
}

/// @nodoc
class __$$_SubmodulesStateCopyWithImpl<$Res>
    extends _$SubmodulesStateCopyWithImpl<$Res, _$_SubmodulesState>
    implements _$$_SubmodulesStateCopyWith<$Res> {
  __$$_SubmodulesStateCopyWithImpl(
      _$_SubmodulesState _value, $Res Function(_$_SubmodulesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submodules = null,
  }) {
    return _then(_$_SubmodulesState(
      submodules: null == submodules
          ? _value._submodules
          : submodules // ignore: cast_nullable_to_non_nullable
              as Set<Submodule>,
    ));
  }
}

/// @nodoc

class _$_SubmodulesState implements _SubmodulesState {
  const _$_SubmodulesState({final Set<Submodule> submodules = const {}})
      : _submodules = submodules;

  final Set<Submodule> _submodules;
  @override
  @JsonKey()
  Set<Submodule> get submodules {
    if (_submodules is EqualUnmodifiableSetView) return _submodules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_submodules);
  }

  @override
  String toString() {
    return 'SubmodulesState(submodules: $submodules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmodulesState &&
            const DeepCollectionEquality()
                .equals(other._submodules, _submodules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_submodules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmodulesStateCopyWith<_$_SubmodulesState> get copyWith =>
      __$$_SubmodulesStateCopyWithImpl<_$_SubmodulesState>(this, _$identity);
}

abstract class _SubmodulesState implements SubmodulesState {
  const factory _SubmodulesState({final Set<Submodule> submodules}) =
      _$_SubmodulesState;

  @override
  Set<Submodule> get submodules;
  @override
  @JsonKey(ignore: true)
  _$$_SubmodulesStateCopyWith<_$_SubmodulesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainContentState {
  Set<Submodule> get activeSubmodules => throw _privateConstructorUsedError;
  int get activeSubmoduleIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainContentStateCopyWith<MainContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainContentStateCopyWith<$Res> {
  factory $MainContentStateCopyWith(
          MainContentState value, $Res Function(MainContentState) then) =
      _$MainContentStateCopyWithImpl<$Res, MainContentState>;
  @useResult
  $Res call({Set<Submodule> activeSubmodules, int activeSubmoduleIndex});
}

/// @nodoc
class _$MainContentStateCopyWithImpl<$Res, $Val extends MainContentState>
    implements $MainContentStateCopyWith<$Res> {
  _$MainContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeSubmodules = null,
    Object? activeSubmoduleIndex = null,
  }) {
    return _then(_value.copyWith(
      activeSubmodules: null == activeSubmodules
          ? _value.activeSubmodules
          : activeSubmodules // ignore: cast_nullable_to_non_nullable
              as Set<Submodule>,
      activeSubmoduleIndex: null == activeSubmoduleIndex
          ? _value.activeSubmoduleIndex
          : activeSubmoduleIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainContentStateCopyWith<$Res>
    implements $MainContentStateCopyWith<$Res> {
  factory _$$_MainContentStateCopyWith(
          _$_MainContentState value, $Res Function(_$_MainContentState) then) =
      __$$_MainContentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<Submodule> activeSubmodules, int activeSubmoduleIndex});
}

/// @nodoc
class __$$_MainContentStateCopyWithImpl<$Res>
    extends _$MainContentStateCopyWithImpl<$Res, _$_MainContentState>
    implements _$$_MainContentStateCopyWith<$Res> {
  __$$_MainContentStateCopyWithImpl(
      _$_MainContentState _value, $Res Function(_$_MainContentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeSubmodules = null,
    Object? activeSubmoduleIndex = null,
  }) {
    return _then(_$_MainContentState(
      activeSubmodules: null == activeSubmodules
          ? _value._activeSubmodules
          : activeSubmodules // ignore: cast_nullable_to_non_nullable
              as Set<Submodule>,
      activeSubmoduleIndex: null == activeSubmoduleIndex
          ? _value.activeSubmoduleIndex
          : activeSubmoduleIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MainContentState implements _MainContentState {
  const _$_MainContentState(
      {final Set<Submodule> activeSubmodules = const {},
      this.activeSubmoduleIndex = 0})
      : _activeSubmodules = activeSubmodules;

  final Set<Submodule> _activeSubmodules;
  @override
  @JsonKey()
  Set<Submodule> get activeSubmodules {
    if (_activeSubmodules is EqualUnmodifiableSetView) return _activeSubmodules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_activeSubmodules);
  }

  @override
  @JsonKey()
  final int activeSubmoduleIndex;

  @override
  String toString() {
    return 'MainContentState(activeSubmodules: $activeSubmodules, activeSubmoduleIndex: $activeSubmoduleIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainContentState &&
            const DeepCollectionEquality()
                .equals(other._activeSubmodules, _activeSubmodules) &&
            (identical(other.activeSubmoduleIndex, activeSubmoduleIndex) ||
                other.activeSubmoduleIndex == activeSubmoduleIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeSubmodules),
      activeSubmoduleIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainContentStateCopyWith<_$_MainContentState> get copyWith =>
      __$$_MainContentStateCopyWithImpl<_$_MainContentState>(this, _$identity);
}

abstract class _MainContentState implements MainContentState {
  const factory _MainContentState(
      {final Set<Submodule> activeSubmodules,
      final int activeSubmoduleIndex}) = _$_MainContentState;

  @override
  Set<Submodule> get activeSubmodules;
  @override
  int get activeSubmoduleIndex;
  @override
  @JsonKey(ignore: true)
  _$$_MainContentStateCopyWith<_$_MainContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
