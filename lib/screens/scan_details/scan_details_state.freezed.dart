// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScanDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanDetailsDeleteEvent value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanDetailsDeleteEvent value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanDetailsDeleteEvent value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanDetailsEventCopyWith<$Res> {
  factory $ScanDetailsEventCopyWith(
          ScanDetailsEvent value, $Res Function(ScanDetailsEvent) then) =
      _$ScanDetailsEventCopyWithImpl<$Res, ScanDetailsEvent>;
}

/// @nodoc
class _$ScanDetailsEventCopyWithImpl<$Res, $Val extends ScanDetailsEvent>
    implements $ScanDetailsEventCopyWith<$Res> {
  _$ScanDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScanDetailsDeleteEventCopyWith<$Res> {
  factory _$$ScanDetailsDeleteEventCopyWith(_$ScanDetailsDeleteEvent value,
          $Res Function(_$ScanDetailsDeleteEvent) then) =
      __$$ScanDetailsDeleteEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScanDetailsDeleteEventCopyWithImpl<$Res>
    extends _$ScanDetailsEventCopyWithImpl<$Res, _$ScanDetailsDeleteEvent>
    implements _$$ScanDetailsDeleteEventCopyWith<$Res> {
  __$$ScanDetailsDeleteEventCopyWithImpl(_$ScanDetailsDeleteEvent _value,
      $Res Function(_$ScanDetailsDeleteEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScanDetailsDeleteEvent implements ScanDetailsDeleteEvent {
  const _$ScanDetailsDeleteEvent();

  @override
  String toString() {
    return 'ScanDetailsEvent.delete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScanDetailsDeleteEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? delete,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanDetailsDeleteEvent value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanDetailsDeleteEvent value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanDetailsDeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class ScanDetailsDeleteEvent implements ScanDetailsEvent {
  const factory ScanDetailsDeleteEvent() = _$ScanDetailsDeleteEvent;
}

/// @nodoc
mixin _$ScanDetailsState {
  String get customName => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanDetailsStateCopyWith<ScanDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanDetailsStateCopyWith<$Res> {
  factory $ScanDetailsStateCopyWith(
          ScanDetailsState value, $Res Function(ScanDetailsState) then) =
      _$ScanDetailsStateCopyWithImpl<$Res, ScanDetailsState>;
  @useResult
  $Res call({String customName, String note});
}

/// @nodoc
class _$ScanDetailsStateCopyWithImpl<$Res, $Val extends ScanDetailsState>
    implements $ScanDetailsStateCopyWith<$Res> {
  _$ScanDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customName = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      customName: null == customName
          ? _value.customName
          : customName // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScanDetailsStateCopyWith<$Res>
    implements $ScanDetailsStateCopyWith<$Res> {
  factory _$$_ScanDetailsStateCopyWith(
          _$_ScanDetailsState value, $Res Function(_$_ScanDetailsState) then) =
      __$$_ScanDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customName, String note});
}

/// @nodoc
class __$$_ScanDetailsStateCopyWithImpl<$Res>
    extends _$ScanDetailsStateCopyWithImpl<$Res, _$_ScanDetailsState>
    implements _$$_ScanDetailsStateCopyWith<$Res> {
  __$$_ScanDetailsStateCopyWithImpl(
      _$_ScanDetailsState _value, $Res Function(_$_ScanDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customName = null,
    Object? note = null,
  }) {
    return _then(_$_ScanDetailsState(
      customName: null == customName
          ? _value.customName
          : customName // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ScanDetailsState implements _ScanDetailsState {
  const _$_ScanDetailsState({required this.customName, required this.note});

  @override
  final String customName;
  @override
  final String note;

  @override
  String toString() {
    return 'ScanDetailsState(customName: $customName, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanDetailsState &&
            (identical(other.customName, customName) ||
                other.customName == customName) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customName, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScanDetailsStateCopyWith<_$_ScanDetailsState> get copyWith =>
      __$$_ScanDetailsStateCopyWithImpl<_$_ScanDetailsState>(this, _$identity);
}

abstract class _ScanDetailsState implements ScanDetailsState {
  const factory _ScanDetailsState(
      {required final String customName,
      required final String note}) = _$_ScanDetailsState;

  @override
  String get customName;
  @override
  String get note;
  @override
  @JsonKey(ignore: true)
  _$$_ScanDetailsStateCopyWith<_$_ScanDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
