// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wb_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GSState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(T data) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function(T data)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GSLoadingState<T> value) loading,
    required TResult Function(GSErrorState<T> value) error,
    required TResult Function(GSDataState<T> value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GSLoadingState<T> value)? loading,
    TResult? Function(GSErrorState<T> value)? error,
    TResult? Function(GSDataState<T> value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GSLoadingState<T> value)? loading,
    TResult Function(GSErrorState<T> value)? error,
    TResult Function(GSDataState<T> value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GSStateCopyWith<T, $Res> {
  factory $GSStateCopyWith(GSState<T> value, $Res Function(GSState<T>) then) =
      _$GSStateCopyWithImpl<T, $Res, GSState<T>>;
}

/// @nodoc
class _$GSStateCopyWithImpl<T, $Res, $Val extends GSState<T>>
    implements $GSStateCopyWith<T, $Res> {
  _$GSStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GSLoadingStateCopyWith<T, $Res> {
  factory _$$GSLoadingStateCopyWith(
          _$GSLoadingState<T> value, $Res Function(_$GSLoadingState<T>) then) =
      __$$GSLoadingStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GSLoadingStateCopyWithImpl<T, $Res>
    extends _$GSStateCopyWithImpl<T, $Res, _$GSLoadingState<T>>
    implements _$$GSLoadingStateCopyWith<T, $Res> {
  __$$GSLoadingStateCopyWithImpl(
      _$GSLoadingState<T> _value, $Res Function(_$GSLoadingState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GSLoadingState<T> implements GSLoadingState<T> {
  const _$GSLoadingState();

  @override
  String toString() {
    return 'GSState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GSLoadingState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(T data) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function(T data)? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GSLoadingState<T> value) loading,
    required TResult Function(GSErrorState<T> value) error,
    required TResult Function(GSDataState<T> value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GSLoadingState<T> value)? loading,
    TResult? Function(GSErrorState<T> value)? error,
    TResult? Function(GSDataState<T> value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GSLoadingState<T> value)? loading,
    TResult Function(GSErrorState<T> value)? error,
    TResult Function(GSDataState<T> value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GSLoadingState<T> implements GSState<T> {
  const factory GSLoadingState() = _$GSLoadingState<T>;
}

/// @nodoc
abstract class _$$GSErrorStateCopyWith<T, $Res> {
  factory _$$GSErrorStateCopyWith(
          _$GSErrorState<T> value, $Res Function(_$GSErrorState<T>) then) =
      __$$GSErrorStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$GSErrorStateCopyWithImpl<T, $Res>
    extends _$GSStateCopyWithImpl<T, $Res, _$GSErrorState<T>>
    implements _$$GSErrorStateCopyWith<T, $Res> {
  __$$GSErrorStateCopyWithImpl(
      _$GSErrorState<T> _value, $Res Function(_$GSErrorState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GSErrorState<T>(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$GSErrorState<T> implements GSErrorState<T> {
  const _$GSErrorState(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'GSState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GSErrorState<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GSErrorStateCopyWith<T, _$GSErrorState<T>> get copyWith =>
      __$$GSErrorStateCopyWithImpl<T, _$GSErrorState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(T data) data,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function(T data)? data,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GSLoadingState<T> value) loading,
    required TResult Function(GSErrorState<T> value) error,
    required TResult Function(GSDataState<T> value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GSLoadingState<T> value)? loading,
    TResult? Function(GSErrorState<T> value)? error,
    TResult? Function(GSDataState<T> value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GSLoadingState<T> value)? loading,
    TResult Function(GSErrorState<T> value)? error,
    TResult Function(GSDataState<T> value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GSErrorState<T> implements GSState<T> {
  const factory GSErrorState(final Object error) = _$GSErrorState<T>;

  Object get error;
  @JsonKey(ignore: true)
  _$$GSErrorStateCopyWith<T, _$GSErrorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GSDataStateCopyWith<T, $Res> {
  factory _$$GSDataStateCopyWith(
          _$GSDataState<T> value, $Res Function(_$GSDataState<T>) then) =
      __$$GSDataStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$GSDataStateCopyWithImpl<T, $Res>
    extends _$GSStateCopyWithImpl<T, $Res, _$GSDataState<T>>
    implements _$$GSDataStateCopyWith<T, $Res> {
  __$$GSDataStateCopyWithImpl(
      _$GSDataState<T> _value, $Res Function(_$GSDataState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GSDataState<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$GSDataState<T> implements GSDataState<T> {
  const _$GSDataState(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'GSState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GSDataState<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GSDataStateCopyWith<T, _$GSDataState<T>> get copyWith =>
      __$$GSDataStateCopyWithImpl<T, _$GSDataState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(T data) data,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function(T data)? data,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GSLoadingState<T> value) loading,
    required TResult Function(GSErrorState<T> value) error,
    required TResult Function(GSDataState<T> value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GSLoadingState<T> value)? loading,
    TResult? Function(GSErrorState<T> value)? error,
    TResult? Function(GSDataState<T> value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GSLoadingState<T> value)? loading,
    TResult Function(GSErrorState<T> value)? error,
    TResult Function(GSDataState<T> value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class GSDataState<T> implements GSState<T> {
  const factory GSDataState(final T data) = _$GSDataState<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$GSDataStateCopyWith<T, _$GSDataState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
