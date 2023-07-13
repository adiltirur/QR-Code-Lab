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

  void updateSaveImage(bool switchValue) {
    emitS(
      state: currentState.copyWith(
        systemSettings: currentState.systemSettings.copyWith(
          shouldSaveImage: switchValue,
        ),
      ),
    );
    _saveToHive();
  }

  void onTapBottomNavigationBar(GSBottomNavigationItem item) {
    emitS(
      state: currentState.copyWith(
        selectedItem: item,
      ),
    );
  }

  HomeBloc({SystemSettings? systemSettings})
      : super(
          HomeState(
            selectedItem: GSBottomNavigationItem.scan,
            systemSettings: SystemSettings(
              defaultCamera: systemSettings != null
                  ? systemSettings.defaultCamera
                  : CameraFacing.back,
              shouldSaveImage:
                  systemSettings != null && systemSettings.shouldSaveImage,
              languageCode: systemSettings?.languageCode,
            ),
          ),
        );
}
