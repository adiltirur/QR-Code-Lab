import 'package:freezed_annotation/freezed_annotation.dart';

part 'wb_state.freezed.dart';

@freezed
class WBState<T> with _$WBState<T> {
  const factory WBState.loading() = WBLoadingState;
  const factory WBState.error(Object error) = WBErrorState;
  const factory WBState.data(T data) = WBDataState;
}
