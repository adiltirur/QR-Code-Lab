import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

enum WBBottomNavigationItem { scan, history, settings }

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loading() = HomeLoadingEvent;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required WBBottomNavigationItem selectedItem,
  }) = _HomeState;
}
