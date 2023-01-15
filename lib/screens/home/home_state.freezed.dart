// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeDeletedEvent value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeDeletedEvent value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeDeletedEvent value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HomeDeletedEventCopyWith<$Res> {
  factory _$$HomeDeletedEventCopyWith(
          _$HomeDeletedEvent value, $Res Function(_$HomeDeletedEvent) then) =
      __$$HomeDeletedEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeDeletedEventCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeDeletedEvent>
    implements _$$HomeDeletedEventCopyWith<$Res> {
  __$$HomeDeletedEventCopyWithImpl(
      _$HomeDeletedEvent _value, $Res Function(_$HomeDeletedEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeDeletedEvent implements HomeDeletedEvent {
  const _$HomeDeletedEvent();

  @override
  String toString() {
    return 'HomeEvent.deleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeDeletedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deleted,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deleted,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeDeletedEvent value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeDeletedEvent value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeDeletedEvent value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class HomeDeletedEvent implements HomeEvent {
  const factory HomeDeletedEvent() = _$HomeDeletedEvent;
}

/// @nodoc
mixin _$HomeState {
  WBBottomNavigationItem get selectedItem => throw _privateConstructorUsedError;
  SystemSettings get systemSettings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {WBBottomNavigationItem selectedItem, SystemSettings systemSettings});

  $SystemSettingsCopyWith<$Res> get systemSettings;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? systemSettings = null,
  }) {
    return _then(_value.copyWith(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as WBBottomNavigationItem,
      systemSettings: null == systemSettings
          ? _value.systemSettings
          : systemSettings // ignore: cast_nullable_to_non_nullable
              as SystemSettings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SystemSettingsCopyWith<$Res> get systemSettings {
    return $SystemSettingsCopyWith<$Res>(_value.systemSettings, (value) {
      return _then(_value.copyWith(systemSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WBBottomNavigationItem selectedItem, SystemSettings systemSettings});

  @override
  $SystemSettingsCopyWith<$Res> get systemSettings;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? systemSettings = null,
  }) {
    return _then(_$_HomeState(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as WBBottomNavigationItem,
      systemSettings: null == systemSettings
          ? _value.systemSettings
          : systemSettings // ignore: cast_nullable_to_non_nullable
              as SystemSettings,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.selectedItem, required this.systemSettings});

  @override
  final WBBottomNavigationItem selectedItem;
  @override
  final SystemSettings systemSettings;

  @override
  String toString() {
    return 'HomeState(selectedItem: $selectedItem, systemSettings: $systemSettings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            (identical(other.systemSettings, systemSettings) ||
                other.systemSettings == systemSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedItem, systemSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final WBBottomNavigationItem selectedItem,
      required final SystemSettings systemSettings}) = _$_HomeState;

  @override
  WBBottomNavigationItem get selectedItem;
  @override
  SystemSettings get systemSettings;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
