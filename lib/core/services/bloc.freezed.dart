// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GSBlocOutput<S, E> {
  S get state => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  List<E> get events => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_GSBlocOutput<S, E> extends _GSBlocOutput<S, E> {
  const _$_GSBlocOutput(
      {required this.state,
      this.isLoading = false,
      this.error,
      final List<E> events = const []})
      : _events = events,
        super._();

  @override
  final S state;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Object? error;
  final List<E> _events;
  @override
  @JsonKey()
  List<E> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'GSBlocOutput<$S, $E>(state: $state, isLoading: $isLoading, error: $error, events: $events)';
  }
}

abstract class _GSBlocOutput<S, E> extends GSBlocOutput<S, E> {
  const factory _GSBlocOutput(
      {required final S state,
      final bool isLoading,
      final Object? error,
      final List<E> events}) = _$_GSBlocOutput<S, E>;
  const _GSBlocOutput._() : super._();

  @override
  S get state;
  @override
  bool get isLoading;
  @override
  Object? get error;
  @override
  List<E> get events;
}
