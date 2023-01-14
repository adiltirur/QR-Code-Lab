import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.done() = SplashDoneEvent;
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState() = _SplashState;
}
