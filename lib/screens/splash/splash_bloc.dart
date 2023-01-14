import '../../core/services/bloc.dart';
import 'splash_state.dart';

class SplashBloc extends WBBloc<SplashState, SplashEvent> {
  void _init() {
    executeSafely(() async {
      emitS(isLoading: true);
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emitS(
        isLoading: false,
        events: [const SplashEvent.done()],
      );
    });
  }

  SplashBloc() : super(const SplashState()) {
    _init();
  }
}
