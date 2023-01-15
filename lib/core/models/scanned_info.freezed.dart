// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanned_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScannedInfo {
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code')
  Uint8List? get qrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bar_code')
  Barcode get barCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_name')
  String? get customName => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScannedInfoCopyWith<ScannedInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScannedInfoCopyWith<$Res> {
  factory $ScannedInfoCopyWith(
          ScannedInfo value, $Res Function(ScannedInfo) then) =
      _$ScannedInfoCopyWithImpl<$Res, ScannedInfo>;
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'qr_code') Uint8List? qrCode,
      @JsonKey(name: 'bar_code') Barcode barCode,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'modified_at') DateTime modifiedAt,
      @JsonKey(name: 'custom_name') String? customName,
      String? note});
}

/// @nodoc
class _$ScannedInfoCopyWithImpl<$Res, $Val extends ScannedInfo>
    implements $ScannedInfoCopyWith<$Res> {
  _$ScannedInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? qrCode = freezed,
    Object? barCode = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
    Object? customName = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      barCode: null == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as Barcode,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customName: freezed == customName
          ? _value.customName
          : customName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScannedInfoCopyWith<$Res>
    implements $ScannedInfoCopyWith<$Res> {
  factory _$$_ScannedInfoCopyWith(
          _$_ScannedInfo value, $Res Function(_$_ScannedInfo) then) =
      __$$_ScannedInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'qr_code') Uint8List? qrCode,
      @JsonKey(name: 'bar_code') Barcode barCode,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'modified_at') DateTime modifiedAt,
      @JsonKey(name: 'custom_name') String? customName,
      String? note});
}

/// @nodoc
class __$$_ScannedInfoCopyWithImpl<$Res>
    extends _$ScannedInfoCopyWithImpl<$Res, _$_ScannedInfo>
    implements _$$_ScannedInfoCopyWith<$Res> {
  __$$_ScannedInfoCopyWithImpl(
      _$_ScannedInfo _value, $Res Function(_$_ScannedInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? qrCode = freezed,
    Object? barCode = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
    Object? customName = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_ScannedInfo(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      barCode: null == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as Barcode,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customName: freezed == customName
          ? _value.customName
          : customName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ScannedInfo implements _ScannedInfo {
  const _$_ScannedInfo(
      {required this.uuid,
      @JsonKey(name: 'qr_code') required this.qrCode,
      @JsonKey(name: 'bar_code') required this.barCode,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'modified_at') required this.modifiedAt,
      @JsonKey(name: 'custom_name') required this.customName,
      required this.note});

  @override
  final String uuid;
  @override
  @JsonKey(name: 'qr_code')
  final Uint8List? qrCode;
  @override
  @JsonKey(name: 'bar_code')
  final Barcode barCode;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;
  @override
  @JsonKey(name: 'custom_name')
  final String? customName;
  @override
  final String? note;

  @override
  String toString() {
    return 'ScannedInfo(uuid: $uuid, qrCode: $qrCode, barCode: $barCode, createdAt: $createdAt, modifiedAt: $modifiedAt, customName: $customName, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScannedInfo &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other.qrCode, qrCode) &&
            (identical(other.barCode, barCode) || other.barCode == barCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.customName, customName) ||
                other.customName == customName) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      const DeepCollectionEquality().hash(qrCode),
      barCode,
      createdAt,
      modifiedAt,
      customName,
      note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScannedInfoCopyWith<_$_ScannedInfo> get copyWith =>
      __$$_ScannedInfoCopyWithImpl<_$_ScannedInfo>(this, _$identity);
}

abstract class _ScannedInfo implements ScannedInfo {
  const factory _ScannedInfo(
      {required final String uuid,
      @JsonKey(name: 'qr_code') required final Uint8List? qrCode,
      @JsonKey(name: 'bar_code') required final Barcode barCode,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'modified_at') required final DateTime modifiedAt,
      @JsonKey(name: 'custom_name') required final String? customName,
      required final String? note}) = _$_ScannedInfo;

  @override
  String get uuid;
  @override
  @JsonKey(name: 'qr_code')
  Uint8List? get qrCode;
  @override
  @JsonKey(name: 'bar_code')
  Barcode get barCode;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt;
  @override
  @JsonKey(name: 'custom_name')
  String? get customName;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_ScannedInfoCopyWith<_$_ScannedInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
