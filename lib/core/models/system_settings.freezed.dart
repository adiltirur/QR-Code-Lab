// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SystemSettings {
  CameraFacing get defaultCamera => throw _privateConstructorUsedError;
  String? get languageCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SystemSettingsCopyWith<SystemSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemSettingsCopyWith<$Res> {
  factory $SystemSettingsCopyWith(
          SystemSettings value, $Res Function(SystemSettings) then) =
      _$SystemSettingsCopyWithImpl<$Res, SystemSettings>;
  @useResult
  $Res call({CameraFacing defaultCamera, String? languageCode});
}

/// @nodoc
class _$SystemSettingsCopyWithImpl<$Res, $Val extends SystemSettings>
    implements $SystemSettingsCopyWith<$Res> {
  _$SystemSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultCamera = null,
    Object? languageCode = freezed,
  }) {
    return _then(_value.copyWith(
      defaultCamera: null == defaultCamera
          ? _value.defaultCamera
          : defaultCamera // ignore: cast_nullable_to_non_nullable
              as CameraFacing,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SystemSettingsCopyWith<$Res>
    implements $SystemSettingsCopyWith<$Res> {
  factory _$$_SystemSettingsCopyWith(
          _$_SystemSettings value, $Res Function(_$_SystemSettings) then) =
      __$$_SystemSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CameraFacing defaultCamera, String? languageCode});
}

/// @nodoc
class __$$_SystemSettingsCopyWithImpl<$Res>
    extends _$SystemSettingsCopyWithImpl<$Res, _$_SystemSettings>
    implements _$$_SystemSettingsCopyWith<$Res> {
  __$$_SystemSettingsCopyWithImpl(
      _$_SystemSettings _value, $Res Function(_$_SystemSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultCamera = null,
    Object? languageCode = freezed,
  }) {
    return _then(_$_SystemSettings(
      defaultCamera: null == defaultCamera
          ? _value.defaultCamera
          : defaultCamera // ignore: cast_nullable_to_non_nullable
              as CameraFacing,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SystemSettings implements _SystemSettings {
  const _$_SystemSettings(
      {required this.defaultCamera, required this.languageCode});

  @override
  final CameraFacing defaultCamera;
  @override
  final String? languageCode;

  @override
  String toString() {
    return 'SystemSettings(defaultCamera: $defaultCamera, languageCode: $languageCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemSettings &&
            (identical(other.defaultCamera, defaultCamera) ||
                other.defaultCamera == defaultCamera) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, defaultCamera, languageCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemSettingsCopyWith<_$_SystemSettings> get copyWith =>
      __$$_SystemSettingsCopyWithImpl<_$_SystemSettings>(this, _$identity);
}

abstract class _SystemSettings implements SystemSettings {
  const factory _SystemSettings(
      {required final CameraFacing defaultCamera,
      required final String? languageCode}) = _$_SystemSettings;

  @override
  CameraFacing get defaultCamera;
  @override
  String? get languageCode;
  @override
  @JsonKey(ignore: true)
  _$$_SystemSettingsCopyWith<_$_SystemSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
