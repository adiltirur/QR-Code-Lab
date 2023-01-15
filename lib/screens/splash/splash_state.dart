import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/models/system_settings.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.done({SystemSettings? systemSettings}) =
      SplashDoneEvent;
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState() = _SplashState;
}
