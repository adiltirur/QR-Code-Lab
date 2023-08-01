import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/models/system_settings.dart';
part 'home_state.freezed.dart';

enum GSBottomNavigationItem { create, scan, history, settings }

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.deleted() = HomeDeletedEvent;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required GSBottomNavigationItem selectedItem,
    required SystemSettings systemSettings,
  }) = _HomeState;
}
