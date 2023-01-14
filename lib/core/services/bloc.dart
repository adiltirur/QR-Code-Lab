import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'error_logger.dart';
import 'wb_state.dart';
part 'bloc.freezed.dart';

@immutable
@Freezed(copyWith: false)
class WBBlocOutput<S, E> with _$WBBlocOutput<S, E> {
  const factory WBBlocOutput({
    required S state,
    @Default(false) bool isLoading,
    Object? error,
    @Default([]) List<E> events,
  }) = _WBBlocOutput;

  const WBBlocOutput._();

  @override
  bool operator ==(other) {
    if (error != null || events.isNotEmpty) return super == other;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WBBlocOutput<S, E> &&
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

class WBBloc<S, E> extends Cubit<WBBlocOutput<S, E>> {
  WBBloc(S initialState, {bool isLoading = false})
      : super(WBBlocOutput<S, E>(state: initialState, isLoading: isLoading));

  @override
  @Deprecated('Use currentOutput or currentState instead')
  WBBlocOutput<S, E> get state => super.state;

  WBBlocOutput<S, E> get currentOutput => super.state;
  S get currentState => currentOutput.state;

  StreamSubscription<WBBlocOutput<S, E>> listen(
    void Function(WBBlocOutput<S, E> event) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    onData(currentOutput);
    return stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  @Deprecated('Use emitS instead')
  void emit(WBBlocOutput<S, E> state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }

  void emitS({S? state, bool? isLoading, Object? error, List<E>? events}) {
    if (isClosed) {
      return;
    }
    super.emit(WBBlocOutput<S, E>(
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

class WBStateBloc<S, E> extends WBBloc<WBState<S>, E> {
  WBStateBloc([S? initialState])
      : super(initialState == null
            ? WBState<S>.loading()
            : WBState.data(initialState));

  S? get currentDataState => currentState.mapOrNull(
        data: (value) => value.data,
      );

  void emitLVState({
    S? state,
    bool? isLoading,
    List<E>? events,
  }) {
    super.emitS(
      state: isLoading == true
          ? const WBState.loading()
          : (state == null ? null : WBState<S>.data(state)),
      events: events,
    );
  }

  void onStateError(Object error, StackTrace stackTrace) {
    ErrorLogger.shared.log(error, stackTrace);
    emitS(state: WBState.error(error));
  }

  Future<T?> executeSafelyWithStateLoader<T>(
    Future<T> Function() callback, {
    void Function(Object error, StackTrace stackTrace)? onError,
  }) async {
    try {
      return await callback();
    } catch (error, stackTrace) {
      final errorHandler = onError ?? onStateError;
      errorHandler(error, stackTrace);
      return null;
    }
  }

  void executeWhenDataState(void Function(S) callback) {
    currentState.whenOrNull<void>(
      data: callback,
    );
  }
}
