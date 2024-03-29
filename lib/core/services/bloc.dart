import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'error_logger.dart';
part 'bloc.freezed.dart';

@immutable
@Freezed(copyWith: false)
class GSBlocOutput<S, E> with _$GSBlocOutput<S, E> {
  const factory GSBlocOutput({
    required S state,
    @Default(false) bool isLoading,
    Object? error,
    @Default([]) List<E> events,
  }) = _GSBlocOutput;

  const GSBlocOutput._();

  @override
  bool operator ==(other) {
    if (error != null || events.isNotEmpty) return super == other;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GSBlocOutput<S, E> &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode {
    if (error != null || events.isNotEmpty) return super.hashCode;
    return Object.hash(runtimeType, const DeepCollectionEquality().hash(state),
        const DeepCollectionEquality().hash(isLoading));
  }
}

class GSBloc<S, E> extends Cubit<GSBlocOutput<S, E>> {
  GSBloc(S initialState, {bool isLoading = false})
      : super(GSBlocOutput<S, E>(state: initialState, isLoading: isLoading));

  @override
  @Deprecated('Use currentOutput or currentState instead')
  GSBlocOutput<S, E> get state => super.state;

  GSBlocOutput<S, E> get currentOutput => super.state;
  S get currentState => currentOutput.state;

  @override
  @Deprecated('Use emitS instead')
  void emit(GSBlocOutput<S, E> state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }

  void emitS({S? state, bool? isLoading, Object? error, List<E>? events}) {
    if (isClosed) {
      return;
    }
    super.emit(GSBlocOutput<S, E>(
      state: state ?? currentState,
      isLoading: isLoading ?? currentOutput.isLoading,
      error: error,
      events: events ?? [],
    ));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    ErrorLogger.shared.log(error, stackTrace);
    emitS(isLoading: false, error: error);
    super.onError(error, stackTrace);
  }

  Future<T?> executeSafely<T>(
    Future<T> Function() callback, {
    void Function(Object error, StackTrace stackTrace)? onError,
  }) async {
    try {
      return await callback();
    } catch (error, stackTrace) {
      final errorHandler = onError ?? this.onError;
      errorHandler(error, stackTrace);
      return null;
    }
  }
}
