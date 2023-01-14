// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) detected,
    required TResult Function() toggleCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? detected,
    TResult? Function()? toggleCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? detected,
    TResult Function()? toggleCamera,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanDetectedEvent value) detected,
    required TResult Function(ScanToggleCameraEvent value) toggleCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanDetectedEvent value)? detected,
    TResult? Function(ScanToggleCameraEvent value)? toggleCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanDetectedEvent value)? detected,
    TResult Function(ScanToggleCameraEvent value)? toggleCamera,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanEventCopyWith<$Res> {
  factory $ScanEventCopyWith(ScanEvent value, $Res Function(ScanEvent) then) =
      _$ScanEventCopyWithImpl<$Res, ScanEvent>;
}

/// @nodoc
class _$ScanEventCopyWithImpl<$Res, $Val extends ScanEvent>
    implements $ScanEventCopyWith<$Res> {
  _$ScanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScanDetectedEventCopyWith<$Res> {
  factory _$$ScanDetectedEventCopyWith(
          _$ScanDetectedEvent value, $Res Function(_$ScanDetectedEvent) then) =
      __$$ScanDetectedEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ScannedInfo scannedInfo});

  $ScannedInfoCopyWith<$Res> get scannedInfo;
}

/// @nodoc
class __$$ScanDetectedEventCopyWithImpl<$Res>
    extends _$ScanEventCopyWithImpl<$Res, _$ScanDetectedEvent>
    implements _$$ScanDetectedEventCopyWith<$Res> {
  __$$ScanDetectedEventCopyWithImpl(
      _$ScanDetectedEvent _value, $Res Function(_$ScanDetectedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scannedInfo = null,
  }) {
    return _then(_$ScanDetectedEvent(
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

class _$ScanDetectedEvent implements ScanDetectedEvent {
  const _$ScanDetectedEvent({required this.scannedInfo});

  @override
  final ScannedInfo scannedInfo;

  @override
  String toString() {
    return 'ScanEvent.detected(scannedInfo: $scannedInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanDetectedEvent &&
            (identical(other.scannedInfo, scannedInfo) ||
                other.scannedInfo == scannedInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scannedInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanDetectedEventCopyWith<_$ScanDetectedEvent> get copyWith =>
      __$$ScanDetectedEventCopyWithImpl<_$ScanDetectedEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) detected,
    required TResult Function() toggleCamera,
  }) {
    return detected(scannedInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? detected,
    TResult? Function()? toggleCamera,
  }) {
    return detected?.call(scannedInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? detected,
    TResult Function()? toggleCamera,
    required TResult orElse(),
  }) {
    if (detected != null) {
      return detected(scannedInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanDetectedEvent value) detected,
    required TResult Function(ScanToggleCameraEvent value) toggleCamera,
  }) {
    return detected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanDetectedEvent value)? detected,
    TResult? Function(ScanToggleCameraEvent value)? toggleCamera,
  }) {
    return detected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanDetectedEvent value)? detected,
    TResult Function(ScanToggleCameraEvent value)? toggleCamera,
    required TResult orElse(),
  }) {
    if (detected != null) {
      return detected(this);
    }
    return orElse();
  }
}

abstract class ScanDetectedEvent implements ScanEvent {
  const factory ScanDetectedEvent({required final ScannedInfo scannedInfo}) =
      _$ScanDetectedEvent;

  ScannedInfo get scannedInfo;
  @JsonKey(ignore: true)
  _$$ScanDetectedEventCopyWith<_$ScanDetectedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScanToggleCameraEventCopyWith<$Res> {
  factory _$$ScanToggleCameraEventCopyWith(_$ScanToggleCameraEvent value,
          $Res Function(_$ScanToggleCameraEvent) then) =
      __$$ScanToggleCameraEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScanToggleCameraEventCopyWithImpl<$Res>
    extends _$ScanEventCopyWithImpl<$Res, _$ScanToggleCameraEvent>
    implements _$$ScanToggleCameraEventCopyWith<$Res> {
  __$$ScanToggleCameraEventCopyWithImpl(_$ScanToggleCameraEvent _value,
      $Res Function(_$ScanToggleCameraEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScanToggleCameraEvent implements ScanToggleCameraEvent {
  const _$ScanToggleCameraEvent();

  @override
  String toString() {
    return 'ScanEvent.toggleCamera()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScanToggleCameraEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) detected,
    required TResult Function() toggleCamera,
  }) {
    return toggleCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? detected,
    TResult? Function()? toggleCamera,
  }) {
    return toggleCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? detected,
    TResult Function()? toggleCamera,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanDetectedEvent value) detected,
    required TResult Function(ScanToggleCameraEvent value) toggleCamera,
  }) {
    return toggleCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanDetectedEvent value)? detected,
    TResult? Function(ScanToggleCameraEvent value)? toggleCamera,
  }) {
    return toggleCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanDetectedEvent value)? detected,
    TResult Function(ScanToggleCameraEvent value)? toggleCamera,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera(this);
    }
    return orElse();
  }
}

abstract class ScanToggleCameraEvent implements ScanEvent {
  const factory ScanToggleCameraEvent() = _$ScanToggleCameraEvent;
}

/// @nodoc
mixin _$ScanState {
  Barcode? get barcode => throw _privateConstructorUsedError;
  MobileScannerArguments? get arguments => throw _privateConstructorUsedError;
  BarcodeCapture? get capture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanStateCopyWith<ScanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanStateCopyWith<$Res> {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) then) =
      _$ScanStateCopyWithImpl<$Res, ScanState>;
  @useResult
  $Res call(
      {Barcode? barcode,
      MobileScannerArguments? arguments,
      BarcodeCapture? capture});
}

/// @nodoc
class _$ScanStateCopyWithImpl<$Res, $Val extends ScanState>
    implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = freezed,
    Object? arguments = freezed,
    Object? capture = freezed,
  }) {
    return _then(_value.copyWith(
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as Barcode?,
      arguments: freezed == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as MobileScannerArguments?,
      capture: freezed == capture
          ? _value.capture
          : capture // ignore: cast_nullable_to_non_nullable
              as BarcodeCapture?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScanStateCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory _$$_ScanStateCopyWith(
          _$_ScanState value, $Res Function(_$_ScanState) then) =
      __$$_ScanStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Barcode? barcode,
      MobileScannerArguments? arguments,
      BarcodeCapture? capture});
}

/// @nodoc
class __$$_ScanStateCopyWithImpl<$Res>
    extends _$ScanStateCopyWithImpl<$Res, _$_ScanState>
    implements _$$_ScanStateCopyWith<$Res> {
  __$$_ScanStateCopyWithImpl(
      _$_ScanState _value, $Res Function(_$_ScanState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = freezed,
    Object? arguments = freezed,
    Object? capture = freezed,
  }) {
    return _then(_$_ScanState(
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as Barcode?,
      arguments: freezed == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as MobileScannerArguments?,
      capture: freezed == capture
          ? _value.capture
          : capture // ignore: cast_nullable_to_non_nullable
              as BarcodeCapture?,
    ));
  }
}

/// @nodoc

class _$_ScanState implements _ScanState {
  const _$_ScanState(
      {required this.barcode, required this.arguments, required this.capture});

  @override
  final Barcode? barcode;
  @override
  final MobileScannerArguments? arguments;
  @override
  final BarcodeCapture? capture;

  @override
  String toString() {
    return 'ScanState(barcode: $barcode, arguments: $arguments, capture: $capture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanState &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments) &&
            (identical(other.capture, capture) || other.capture == capture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode, arguments, capture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScanStateCopyWith<_$_ScanState> get copyWith =>
      __$$_ScanStateCopyWithImpl<_$_ScanState>(this, _$identity);
}

abstract class _ScanState implements ScanState {
  const factory _ScanState(
      {required final Barcode? barcode,
      required final MobileScannerArguments? arguments,
      required final BarcodeCapture? capture}) = _$_ScanState;

  @override
  Barcode? get barcode;
  @override
  MobileScannerArguments? get arguments;
  @override
  BarcodeCapture? get capture;
  @override
  @JsonKey(ignore: true)
  _$$_ScanStateCopyWith<_$_ScanState> get copyWith =>
      throw _privateConstructorUsedError;
}
