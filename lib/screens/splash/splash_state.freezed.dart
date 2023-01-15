// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashEvent {
  SystemSettings? get systemSettings => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SystemSettings? systemSettings) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SystemSettings? systemSettings)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SystemSettings? systemSettings)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashDoneEvent value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashDoneEvent value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashDoneEvent value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashEventCopyWith<SplashEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
          SplashEvent value, $Res Function(SplashEvent) then) =
      _$SplashEventCopyWithImpl<$Res, SplashEvent>;
  @useResult
  $Res call({SystemSettings? systemSettings});

  $SystemSettingsCopyWith<$Res>? get systemSettings;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res, $Val extends SplashEvent>
    implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systemSettings = freezed,
  }) {
    return _then(_value.copyWith(
      systemSettings: freezed == systemSettings
          ? _value.systemSettings
          : systemSettings // ignore: cast_nullable_to_non_nullable
              as SystemSettings?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SystemSettingsCopyWith<$Res>? get systemSettings {
    if (_value.systemSettings == null) {
      return null;
    }

    return $SystemSettingsCopyWith<$Res>(_value.systemSettings!, (value) {
      return _then(_value.copyWith(systemSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplashDoneEventCopyWith<$Res>
    implements $SplashEventCopyWith<$Res> {
  factory _$$SplashDoneEventCopyWith(
          _$SplashDoneEvent value, $Res Function(_$SplashDoneEvent) then) =
      __$$SplashDoneEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SystemSettings? systemSettings});

  @override
  $SystemSettingsCopyWith<$Res>? get systemSettings;
}

/// @nodoc
class __$$SplashDoneEventCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$SplashDoneEvent>
    implements _$$SplashDoneEventCopyWith<$Res> {
  __$$SplashDoneEventCopyWithImpl(
      _$SplashDoneEvent _value, $Res Function(_$SplashDoneEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systemSettings = freezed,
  }) {
    return _then(_$SplashDoneEvent(
      systemSettings: freezed == systemSettings
          ? _value.systemSettings
          : systemSettings // ignore: cast_nullable_to_non_nullable
              as SystemSettings?,
    ));
  }
}

/// @nodoc

class _$SplashDoneEvent implements SplashDoneEvent {
  const _$SplashDoneEvent({this.systemSettings});

  @override
  final SystemSettings? systemSettings;

  @override
  String toString() {
    return 'SplashEvent.done(systemSettings: $systemSettings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashDoneEvent &&
            (identical(other.systemSettings, systemSettings) ||
                other.systemSettings == systemSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, systemSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashDoneEventCopyWith<_$SplashDoneEvent> get copyWith =>
      __$$SplashDoneEventCopyWithImpl<_$SplashDoneEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SystemSettings? systemSettings) done,
  }) {
    return done(systemSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SystemSettings? systemSettings)? done,
  }) {
    return done?.call(systemSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SystemSettings? systemSettings)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(systemSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashDoneEvent value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashDoneEvent value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashDoneEvent value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class SplashDoneEvent implements SplashEvent {
  const factory SplashDoneEvent({final SystemSettings? systemSettings}) =
      _$SplashDoneEvent;

  @override
  SystemSettings? get systemSettings;
  @override
  @JsonKey(ignore: true)
  _$$SplashDoneEventCopyWith<_$SplashDoneEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SplashState {}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SplashStateCopyWith<$Res> {
  factory _$$_SplashStateCopyWith(
          _$_SplashState value, $Res Function(_$_SplashState) then) =
      __$$_SplashStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SplashStateCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_SplashState>
    implements _$$_SplashStateCopyWith<$Res> {
  __$$_SplashStateCopyWithImpl(
      _$_SplashState _value, $Res Function(_$_SplashState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SplashState implements _SplashState {
  const _$_SplashState();

  @override
  String toString() {
    return 'SplashState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SplashState);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _SplashState implements SplashState {
  const factory _SplashState() = _$_SplashState;
}
