import 'package:freezed_annotation/freezed_annotation.dart';

part 'wb_state.freezed.dart';

@freezed
class GSState<T> with _$GSState<T> {
  const factory GSState.loading() = GSLoadingState;
  const factory GSState.error(Object error) = GSErrorState;
  const factory GSState.data(T data) = GSDataState;
}
