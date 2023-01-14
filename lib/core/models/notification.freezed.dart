// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WBNotification {
  WBNotificationType get type => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WBNotificationCopyWith<WBNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WBNotificationCopyWith<$Res> {
  factory $WBNotificationCopyWith(
          WBNotification value, $Res Function(WBNotification) then) =
      _$WBNotificationCopyWithImpl<$Res, WBNotification>;
  @useResult
  $Res call({WBNotificationType type, String text});
}

/// @nodoc
class _$WBNotificationCopyWithImpl<$Res, $Val extends WBNotification>
    implements $WBNotificationCopyWith<$Res> {
  _$WBNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WBNotificationType,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WBNotificationCopyWith<$Res>
    implements $WBNotificationCopyWith<$Res> {
  factory _$$_WBNotificationCopyWith(
          _$_WBNotification value, $Res Function(_$_WBNotification) then) =
      __$$_WBNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WBNotificationType type, String text});
}

/// @nodoc
class __$$_WBNotificationCopyWithImpl<$Res>
    extends _$WBNotificationCopyWithImpl<$Res, _$_WBNotification>
    implements _$$_WBNotificationCopyWith<$Res> {
  __$$_WBNotificationCopyWithImpl(
      _$_WBNotification _value, $Res Function(_$_WBNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_$_WBNotification(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WBNotificationType,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WBNotification implements _WBNotification {
  const _$_WBNotification({required this.type, required this.text});

  @override
  final WBNotificationType type;
  @override
  final String text;

  @override
  String toString() {
    return 'WBNotification(type: $type, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WBNotification &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WBNotificationCopyWith<_$_WBNotification> get copyWith =>
      __$$_WBNotificationCopyWithImpl<_$_WBNotification>(this, _$identity);
}

abstract class _WBNotification implements WBNotification {
  const factory _WBNotification(
      {required final WBNotificationType type,
      required final String text}) = _$_WBNotification;

  @override
  WBNotificationType get type;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_WBNotificationCopyWith<_$_WBNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
