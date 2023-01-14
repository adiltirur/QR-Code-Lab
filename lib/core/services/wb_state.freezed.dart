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
mixin _$WBState<T> {
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
    required TResult Function(WBLoadingState<T> value) loading,
    required TResult Function(WBErrorState<T> value) error,
    required TResult Function(WBDataState<T> value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WBLoadingState<T> value)? loading,
    TResult? Function(WBErrorState<T> value)? error,
    TResult? Function(WBDataState<T> value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WBLoadingState<T> value)? loading,
    TResult Function(WBErrorState<T> value)? error,
    TResult Function(WBDataState<T> value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WBStateCopyWith<T, $Res> {
  factory $WBStateCopyWith(WBState<T> value, $Res Function(WBState<T>) then) =
      _$WBStateCopyWithImpl<T, $Res, WBState<T>>;
}

/// @nodoc
class _$WBStateCopyWithImpl<T, $Res, $Val extends WBState<T>>
    implements $WBStateCopyWith<T, $Res> {
  _$WBStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WBLoadingStateCopyWith<T, $Res> {
  factory _$$WBLoadingStateCopyWith(
          _$WBLoadingState<T> value, $Res Function(_$WBLoadingState<T>) then) =
      __$$WBLoadingStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$WBLoadingStateCopyWithImpl<T, $Res>
    extends _$WBStateCopyWithImpl<T, $Res, _$WBLoadingState<T>>
    implements _$$WBLoadingStateCopyWith<T, $Res> {
  __$$WBLoadingStateCopyWithImpl(
      _$WBLoadingState<T> _value, $Res Function(_$WBLoadingState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WBLoadingState<T> implements WBLoadingState<T> {
  const _$WBLoadingState();

  @override
  String toString() {
    return 'WBState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WBLoadingState<T>);
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
    required TResult Function(WBLoadingState<T> value) loading,
    required TResult Function(WBErrorState<T> value) error,
    required TResult Function(WBDataState<T> value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WBLoadingState<T> value)? loading,
    TResult? Function(WBErrorState<T> value)? error,
    TResult? Function(WBDataState<T> value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WBLoadingState<T> value)? loading,
    TResult Function(WBErrorState<T> value)? error,
    TResult Function(WBDataState<T> value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WBLoadingState<T> implements WBState<T> {
  const factory WBLoadingState() = _$WBLoadingState<T>;
}

/// @nodoc
abstract class _$$WBErrorStateCopyWith<T, $Res> {
  factory _$$WBErrorStateCopyWith(
          _$WBErrorState<T> value, $Res Function(_$WBErrorState<T>) then) =
      __$$WBErrorStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$WBErrorStateCopyWithImpl<T, $Res>
    extends _$WBStateCopyWithImpl<T, $Res, _$WBErrorState<T>>
    implements _$$WBErrorStateCopyWith<T, $Res> {
  __$$WBErrorStateCopyWithImpl(
      _$WBErrorState<T> _value, $Res Function(_$WBErrorState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$WBErrorState<T>(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$WBErrorState<T> implements WBErrorState<T> {
  const _$WBErrorState(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'WBState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WBErrorState<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WBErrorStateCopyWith<T, _$WBErrorState<T>> get copyWith =>
      __$$WBErrorStateCopyWithImpl<T, _$WBErrorState<T>>(this, _$identity);

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
    required TResult Function(WBLoadingState<T> value) loading,
    required TResult Function(WBErrorState<T> value) error,
    required TResult Function(WBDataState<T> value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WBLoadingState<T> value)? loading,
    TResult? Function(WBErrorState<T> value)? error,
    TResult? Function(WBDataState<T> value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WBLoadingState<T> value)? loading,
    TResult Function(WBErrorState<T> value)? error,
    TResult Function(WBDataState<T> value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WBErrorState<T> implements WBState<T> {
  const factory WBErrorState(final Object error) = _$WBErrorState<T>;

  Object get error;
  @JsonKey(ignore: true)
  _$$WBErrorStateCopyWith<T, _$WBErrorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WBDataStateCopyWith<T, $Res> {
  factory _$$WBDataStateCopyWith(
          _$WBDataState<T> value, $Res Function(_$WBDataState<T>) then) =
      __$$WBDataStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$WBDataStateCopyWithImpl<T, $Res>
    extends _$WBStateCopyWithImpl<T, $Res, _$WBDataState<T>>
    implements _$$WBDataStateCopyWith<T, $Res> {
  __$$WBDataStateCopyWithImpl(
      _$WBDataState<T> _value, $Res Function(_$WBDataState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$WBDataState<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$WBDataState<T> implements WBDataState<T> {
  const _$WBDataState(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'WBState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WBDataState<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WBDataStateCopyWith<T, _$WBDataState<T>> get copyWith =>
      __$$WBDataStateCopyWithImpl<T, _$WBDataState<T>>(this, _$identity);

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
    required TResult Function(WBLoadingState<T> value) loading,
    required TResult Function(WBErrorState<T> value) error,
    required TResult Function(WBDataState<T> value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WBLoadingState<T> value)? loading,
    TResult? Function(WBErrorState<T> value)? error,
    TResult? Function(WBDataState<T> value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WBLoadingState<T> value)? loading,
    TResult Function(WBErrorState<T> value)? error,
    TResult Function(WBDataState<T> value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class WBDataState<T> implements WBState<T> {
  const factory WBDataState(final T data) = _$WBDataState<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$WBDataStateCopyWith<T, _$WBDataState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
