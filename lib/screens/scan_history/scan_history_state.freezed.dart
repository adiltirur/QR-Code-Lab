// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScanHistoryEvent {
  ScannedInfo get scannedInfo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanHistoryOpenEvent value) open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanHistoryOpenEvent value)? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanHistoryOpenEvent value)? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanHistoryEventCopyWith<ScanHistoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanHistoryEventCopyWith<$Res> {
  factory $ScanHistoryEventCopyWith(
          ScanHistoryEvent value, $Res Function(ScanHistoryEvent) then) =
      _$ScanHistoryEventCopyWithImpl<$Res, ScanHistoryEvent>;
  @useResult
  $Res call({ScannedInfo scannedInfo});

  $ScannedInfoCopyWith<$Res> get scannedInfo;
}

/// @nodoc
class _$ScanHistoryEventCopyWithImpl<$Res, $Val extends ScanHistoryEvent>
    implements $ScanHistoryEventCopyWith<$Res> {
  _$ScanHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scannedInfo = null,
  }) {
    return _then(_value.copyWith(
      scannedInfo: null == scannedInfo
          ? _value.scannedInfo
          : scannedInfo // ignore: cast_nullable_to_non_nullable
              as ScannedInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScannedInfoCopyWith<$Res> get scannedInfo {
    return $ScannedInfoCopyWith<$Res>(_value.scannedInfo, (value) {
      return _then(_value.copyWith(scannedInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScanHistoryOpenEventCopyWith<$Res>
    implements $ScanHistoryEventCopyWith<$Res> {
  factory _$$ScanHistoryOpenEventCopyWith(_$ScanHistoryOpenEvent value,
          $Res Function(_$ScanHistoryOpenEvent) then) =
      __$$ScanHistoryOpenEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScannedInfo scannedInfo});

  @override
  $ScannedInfoCopyWith<$Res> get scannedInfo;
}

/// @nodoc
class __$$ScanHistoryOpenEventCopyWithImpl<$Res>
    extends _$ScanHistoryEventCopyWithImpl<$Res, _$ScanHistoryOpenEvent>
    implements _$$ScanHistoryOpenEventCopyWith<$Res> {
  __$$ScanHistoryOpenEventCopyWithImpl(_$ScanHistoryOpenEvent _value,
      $Res Function(_$ScanHistoryOpenEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scannedInfo = null,
  }) {
    return _then(_$ScanHistoryOpenEvent(
      scannedInfo: null == scannedInfo
          ? _value.scannedInfo
          : scannedInfo // ignore: cast_nullable_to_non_nullable
              as ScannedInfo,
    ));
  }
}

/// @nodoc

class _$ScanHistoryOpenEvent implements ScanHistoryOpenEvent {
  const _$ScanHistoryOpenEvent({required this.scannedInfo});

  @override
  final ScannedInfo scannedInfo;

  @override
  String toString() {
    return 'ScanHistoryEvent.open(scannedInfo: $scannedInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanHistoryOpenEvent &&
            (identical(other.scannedInfo, scannedInfo) ||
                other.scannedInfo == scannedInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scannedInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanHistoryOpenEventCopyWith<_$ScanHistoryOpenEvent> get copyWith =>
      __$$ScanHistoryOpenEventCopyWithImpl<_$ScanHistoryOpenEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScannedInfo scannedInfo) open,
  }) {
    return open(scannedInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScannedInfo scannedInfo)? open,
  }) {
    return open?.call(scannedInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScannedInfo scannedInfo)? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(scannedInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanHistoryOpenEvent value) open,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanHistoryOpenEvent value)? open,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanHistoryOpenEvent value)? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class ScanHistoryOpenEvent implements ScanHistoryEvent {
  const factory ScanHistoryOpenEvent({required final ScannedInfo scannedInfo}) =
      _$ScanHistoryOpenEvent;

  @override
  ScannedInfo get scannedInfo;
  @override
  @JsonKey(ignore: true)
  _$$ScanHistoryOpenEventCopyWith<_$ScanHistoryOpenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScanHistoryState {
  List<HiveScannedItem> get scannedItems => throw _privateConstructorUsedError;
  bool get reverseList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanHistoryStateCopyWith<ScanHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanHistoryStateCopyWith<$Res> {
  factory $ScanHistoryStateCopyWith(
          ScanHistoryState value, $Res Function(ScanHistoryState) then) =
      _$ScanHistoryStateCopyWithImpl<$Res, ScanHistoryState>;
  @useResult
  $Res call({List<HiveScannedItem> scannedItems, bool reverseList});
}

/// @nodoc
class _$ScanHistoryStateCopyWithImpl<$Res, $Val extends ScanHistoryState>
    implements $ScanHistoryStateCopyWith<$Res> {
  _$ScanHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scannedItems = null,
    Object? reverseList = null,
  }) {
    return _then(_value.copyWith(
      scannedItems: null == scannedItems
          ? _value.scannedItems
          : scannedItems // ignore: cast_nullable_to_non_nullable
              as List<HiveScannedItem>,
      reverseList: null == reverseList
          ? _value.reverseList
          : reverseList // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScanHistoryStateCopyWith<$Res>
    implements $ScanHistoryStateCopyWith<$Res> {
  factory _$$_ScanHistoryStateCopyWith(
          _$_ScanHistoryState value, $Res Function(_$_ScanHistoryState) then) =
      __$$_ScanHistoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HiveScannedItem> scannedItems, bool reverseList});
}

/// @nodoc
class __$$_ScanHistoryStateCopyWithImpl<$Res>
    extends _$ScanHistoryStateCopyWithImpl<$Res, _$_ScanHistoryState>
    implements _$$_ScanHistoryStateCopyWith<$Res> {
  __$$_ScanHistoryStateCopyWithImpl(
      _$_ScanHistoryState _value, $Res Function(_$_ScanHistoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scannedItems = null,
    Object? reverseList = null,
  }) {
    return _then(_$_ScanHistoryState(
      scannedItems: null == scannedItems
          ? _value._scannedItems
          : scannedItems // ignore: cast_nullable_to_non_nullable
              as List<HiveScannedItem>,
      reverseList: null == reverseList
          ? _value.reverseList
          : reverseList // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ScanHistoryState implements _ScanHistoryState {
  const _$_ScanHistoryState(
      {required final List<HiveScannedItem> scannedItems,
      required this.reverseList})
      : _scannedItems = scannedItems;

  final List<HiveScannedItem> _scannedItems;
  @override
  List<HiveScannedItem> get scannedItems {
    if (_scannedItems is EqualUnmodifiableListView) return _scannedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scannedItems);
  }

  @override
  final bool reverseList;

  @override
  String toString() {
    return 'ScanHistoryState(scannedItems: $scannedItems, reverseList: $reverseList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanHistoryState &&
            const DeepCollectionEquality()
                .equals(other._scannedItems, _scannedItems) &&
            (identical(other.reverseList, reverseList) ||
                other.reverseList == reverseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_scannedItems), reverseList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScanHistoryStateCopyWith<_$_ScanHistoryState> get copyWith =>
      __$$_ScanHistoryStateCopyWithImpl<_$_ScanHistoryState>(this, _$identity);
}

abstract class _ScanHistoryState implements ScanHistoryState {
  const factory _ScanHistoryState(
      {required final List<HiveScannedItem> scannedItems,
      required final bool reverseList}) = _$_ScanHistoryState;

  @override
  List<HiveScannedItem> get scannedItems;
  @override
  bool get reverseList;
  @override
  @JsonKey(ignore: true)
  _$$_ScanHistoryStateCopyWith<_$_ScanHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
