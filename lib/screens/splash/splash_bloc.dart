import '../../core/services/bloc.dart';
import '../../repository/system/system_repository.dart';
import 'splash_state.dart';

class SplashBloc extends GSBloc<SplashState, SplashEvent> {
  final _systemRepository = SystemRepository();

  void _init() {
    executeSafely(() async {
      emitS(isLoading: true);
      await Future.delayed(
        const Duration(seconds: 2),
      );
      final systemInfo = await _systemRepository.getSystemInfo();

      emitS(
        isLoading: false,
        events: [SplashEvent.done(systemSettings: systemInfo)],
      );
    });
  }

  SplashBloc() : super(const SplashState()) {
    _init();
  }
}
