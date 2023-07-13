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
mixin _$GSNotification {
  GSNotificationType get type => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GSNotificationCopyWith<GSNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GSNotificationCopyWith<$Res> {
  factory $GSNotificationCopyWith(
          GSNotification value, $Res Function(GSNotification) then) =
      _$GSNotificationCopyWithImpl<$Res, GSNotification>;
  @useResult
  $Res call({GSNotificationType type, String text});
}

/// @nodoc
class _$GSNotificationCopyWithImpl<$Res, $Val extends GSNotification>
    implements $GSNotificationCopyWith<$Res> {
  _$GSNotificationCopyWithImpl(this._value, this._then);

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
              as GSNotificationType,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GSNotificationCopyWith<$Res>
    implements $GSNotificationCopyWith<$Res> {
  factory _$$_GSNotificationCopyWith(
          _$_GSNotification value, $Res Function(_$_GSNotification) then) =
      __$$_GSNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GSNotificationType type, String text});
}

/// @nodoc
class __$$_GSNotificationCopyWithImpl<$Res>
    extends _$GSNotificationCopyWithImpl<$Res, _$_GSNotification>
    implements _$$_GSNotificationCopyWith<$Res> {
  __$$_GSNotificationCopyWithImpl(
      _$_GSNotification _value, $Res Function(_$_GSNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_$_GSNotification(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GSNotificationType,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GSNotification implements _GSNotification {
  const _$_GSNotification({required this.type, required this.text});

  @override
  final GSNotificationType type;
  @override
  final String text;

  @override
  String toString() {
    return 'GSNotification(type: $type, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GSNotification &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GSNotificationCopyWith<_$_GSNotification> get copyWith =>
      __$$_GSNotificationCopyWithImpl<_$_GSNotification>(this, _$identity);
}

abstract class _GSNotification implements GSNotification {
  const factory _GSNotification(
      {required final GSNotificationType type,
      required final String text}) = _$_GSNotification;

  @override
  GSNotificationType get type;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_GSNotificationCopyWith<_$_GSNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
