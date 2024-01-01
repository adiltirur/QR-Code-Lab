import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/models/language.dart';
import '../../core/models/system_settings.dart';
import '../../core/services/bloc.dart';
import '../../repository/scanner/scanner_repository.dart';
import '../../repository/system/system_repository.dart';
import 'home_state.dart';

class HomeBloc extends GSBloc<HomeState, HomeEvent> {
  final _systemRepository = SystemRepository();
  final _scannerRepository = ScannerRepository();

  void toggleAppStatus(bool isActive) {
    emitS(
      state: currentState.copyWith(
        isActive: isActive,
      ),
    );
  }

  Future<void> deleteScanHistory() async {
    emitS(isLoading: true);
    await _scannerRepository.deleteScanHistory();
    emitS(
      isLoading: false,
      events: [
        const HomeEvent.deleted(),
      ],
    );
  }

  void updateTheme(bool isDarkMode) {
    emitS(
      state: currentState.copyWith(
        systemSettings: currentState.systemSettings.copyWith(
          isDarkMode: isDarkMode,
        ),
      ),
    );
    _saveToHive();
  }

  void updateLanguage(Language language) {
    emitS(
      state: currentState.copyWith(
        systemSettings: currentState.systemSettings.copyWith(
          languageCode: language.locale.languageCode,
        ),
      ),
    );
    _saveToHive();
  }

  void updateDefaultCamera(CameraFacing cameraFacing) {
    emitS(
      state: currentState.copyWith(
        systemSettings: currentState.systemSettings.copyWith(
          defaultCamera: cameraFacing,
        ),
      ),
    );
    _saveToHive();
  }

  void _saveToHive() {
    _systemRepository.saveSystemInfo(currentState.systemSettings);
  }

  void onTapBottomNavigationBar(GSBottomNavigationItem item) {
    emitS(
      state: currentState.copyWith(
        selectedItem: item,
      ),
    );
  }

  HomeBloc({
    required bool isDarkMode,
    SystemSettings? systemSettings,
  }) : super(
          HomeState(
            selectedItem: GSBottomNavigationItem.create,
            systemSettings: SystemSettings(
              defaultCamera: systemSettings != null
                  ? systemSettings.defaultCamera
                  : CameraFacing.back,
              isDarkMode: systemSettings != null
                  ? systemSettings.isDarkMode
                  : isDarkMode,
              languageCode: systemSettings?.languageCode,
            ),
            isActive: true,
          ),
        );
}
