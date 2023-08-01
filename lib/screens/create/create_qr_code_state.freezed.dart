// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_qr_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateQRCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) created,
    required TResult Function() onBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? created,
    TResult? Function()? onBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? created,
    TResult Function()? onBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateQRCodeCreatedEvent value) created,
    required TResult Function(CreateQRCodeOnBackEvent value) onBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateQRCodeCreatedEvent value)? created,
    TResult? Function(CreateQRCodeOnBackEvent value)? onBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateQRCodeCreatedEvent value)? created,
    TResult Function(CreateQRCodeOnBackEvent value)? onBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateQRCodeEventCopyWith<$Res> {
  factory $CreateQRCodeEventCopyWith(
          CreateQRCodeEvent value, $Res Function(CreateQRCodeEvent) then) =
      _$CreateQRCodeEventCopyWithImpl<$Res, CreateQRCodeEvent>;
}

/// @nodoc
class _$CreateQRCodeEventCopyWithImpl<$Res, $Val extends CreateQRCodeEvent>
    implements $CreateQRCodeEventCopyWith<$Res> {
  _$CreateQRCodeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateQRCodeCreatedEventCopyWith<$Res> {
  factory _$$CreateQRCodeCreatedEventCopyWith(_$CreateQRCodeCreatedEvent value,
          $Res Function(_$CreateQRCodeCreatedEvent) then) =
      __$$CreateQRCodeCreatedEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ScannedInfo scannedInfo});

  $ScannedInfoCopyWith<$Res> get scannedInfo;
}

/// @nodoc
class __$$CreateQRCodeCreatedEventCopyWithImpl<$Res>
    extends _$CreateQRCodeEventCopyWithImpl<$Res, _$CreateQRCodeCreatedEvent>
    implements _$$CreateQRCodeCreatedEventCopyWith<$Res> {
  __$$CreateQRCodeCreatedEventCopyWithImpl(_$CreateQRCodeCreatedEvent _value,
      $Res Function(_$CreateQRCodeCreatedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scannedInfo = null,
  }) {
    return _then(_$CreateQRCodeCreatedEvent(
      scannedInfo: null == scannedInfo
          ? _value.scannedInfo
          : scannedInfo // ignore: cast_nullable_to_non_nullable
              as ScannedInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ScannedInfoCopyWith<$Res> get scannedInfo {
    return $ScannedInfoCopyWith<$Res>(_value.scannedInfo, (value) {
      return _then(_value.copyWith(scannedInfo: value));
    });
  }
}

/// @nodoc

class _$CreateQRCodeCreatedEvent implements CreateQRCodeCreatedEvent {
  const _$CreateQRCodeCreatedEvent({required this.scannedInfo});

  @override
  final ScannedInfo scannedInfo;

  @override
  String toString() {
    return 'CreateQRCodeEvent.created(scannedInfo: $scannedInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateQRCodeCreatedEvent &&
            (identical(other.scannedInfo, scannedInfo) ||
                other.scannedInfo == scannedInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scannedInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateQRCodeCreatedEventCopyWith<_$CreateQRCodeCreatedEvent>
      get copyWith =>
          __$$CreateQRCodeCreatedEventCopyWithImpl<_$CreateQRCodeCreatedEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) created,
    required TResult Function() onBack,
  }) {
    return created(scannedInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? created,
    TResult? Function()? onBack,
  }) {
    return created?.call(scannedInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? created,
    TResult Function()? onBack,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(scannedInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateQRCodeCreatedEvent value) created,
    required TResult Function(CreateQRCodeOnBackEvent value) onBack,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateQRCodeCreatedEvent value)? created,
    TResult? Function(CreateQRCodeOnBackEvent value)? onBack,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateQRCodeCreatedEvent value)? created,
    TResult Function(CreateQRCodeOnBackEvent value)? onBack,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class CreateQRCodeCreatedEvent implements CreateQRCodeEvent {
  const factory CreateQRCodeCreatedEvent(
      {required final ScannedInfo scannedInfo}) = _$CreateQRCodeCreatedEvent;

  ScannedInfo get scannedInfo;
  @JsonKey(ignore: true)
  _$$CreateQRCodeCreatedEventCopyWith<_$CreateQRCodeCreatedEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateQRCodeOnBackEventCopyWith<$Res> {
  factory _$$CreateQRCodeOnBackEventCopyWith(_$CreateQRCodeOnBackEvent value,
          $Res Function(_$CreateQRCodeOnBackEvent) then) =
      __$$CreateQRCodeOnBackEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateQRCodeOnBackEventCopyWithImpl<$Res>
    extends _$CreateQRCodeEventCopyWithImpl<$Res, _$CreateQRCodeOnBackEvent>
    implements _$$CreateQRCodeOnBackEventCopyWith<$Res> {
  __$$CreateQRCodeOnBackEventCopyWithImpl(_$CreateQRCodeOnBackEvent _value,
      $Res Function(_$CreateQRCodeOnBackEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateQRCodeOnBackEvent implements CreateQRCodeOnBackEvent {
  const _$CreateQRCodeOnBackEvent();

  @override
  String toString() {
    return 'CreateQRCodeEvent.onBack()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateQRCodeOnBackEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) created,
    required TResult Function() onBack,
  }) {
    return onBack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? created,
    TResult? Function()? onBack,
  }) {
    return onBack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? created,
    TResult Function()? onBack,
    required TResult orElse(),
  }) {
    if (onBack != null) {
      return onBack();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateQRCodeCreatedEvent value) created,
    required TResult Function(CreateQRCodeOnBackEvent value) onBack,
  }) {
    return onBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateQRCodeCreatedEvent value)? created,
    TResult? Function(CreateQRCodeOnBackEvent value)? onBack,
  }) {
    return onBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateQRCodeCreatedEvent value)? created,
    TResult Function(CreateQRCodeOnBackEvent value)? onBack,
    required TResult orElse(),
  }) {
    if (onBack != null) {
      return onBack(this);
    }
    return orElse();
  }
}

abstract class CreateQRCodeOnBackEvent implements CreateQRCodeEvent {
  const factory CreateQRCodeOnBackEvent() = _$CreateQRCodeOnBackEvent;
}

/// @nodoc
mixin _$CreateQRCodeState {
  String? get text => throw _privateConstructorUsedError;
  QRCodeItem get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateQRCodeStateCopyWith<CreateQRCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateQRCodeStateCopyWith<$Res> {
  factory $CreateQRCodeStateCopyWith(
          CreateQRCodeState value, $Res Function(CreateQRCodeState) then) =
      _$CreateQRCodeStateCopyWithImpl<$Res, CreateQRCodeState>;
  @useResult
  $Res call({String? text, QRCodeItem type});
}

/// @nodoc
class _$CreateQRCodeStateCopyWithImpl<$Res, $Val extends CreateQRCodeState>
    implements $CreateQRCodeStateCopyWith<$Res> {
  _$CreateQRCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QRCodeItem,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateQRCodeStateCopyWith<$Res>
    implements $CreateQRCodeStateCopyWith<$Res> {
  factory _$$_CreateQRCodeStateCopyWith(_$_CreateQRCodeState value,
          $Res Function(_$_CreateQRCodeState) then) =
      __$$_CreateQRCodeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, QRCodeItem type});
}

/// @nodoc
class __$$_CreateQRCodeStateCopyWithImpl<$Res>
    extends _$CreateQRCodeStateCopyWithImpl<$Res, _$_CreateQRCodeState>
    implements _$$_CreateQRCodeStateCopyWith<$Res> {
  __$$_CreateQRCodeStateCopyWithImpl(
      _$_CreateQRCodeState _value, $Res Function(_$_CreateQRCodeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = null,
  }) {
    return _then(_$_CreateQRCodeState(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QRCodeItem,
    ));
  }
}

/// @nodoc

class _$_CreateQRCodeState implements _CreateQRCodeState {
  const _$_CreateQRCodeState({required this.text, required this.type});

  @override
  final String? text;
  @override
  final QRCodeItem type;

  @override
  String toString() {
    return 'CreateQRCodeState(text: $text, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateQRCodeState &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateQRCodeStateCopyWith<_$_CreateQRCodeState> get copyWith =>
      __$$_CreateQRCodeStateCopyWithImpl<_$_CreateQRCodeState>(
          this, _$identity);
}

abstract class _CreateQRCodeState implements CreateQRCodeState {
  const factory _CreateQRCodeState(
      {required final String? text,
      required final QRCodeItem type}) = _$_CreateQRCodeState;

  @override
  String? get text;
  @override
  QRCodeItem get type;
  @override
  @JsonKey(ignore: true)
  _$$_CreateQRCodeStateCopyWith<_$_CreateQRCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
