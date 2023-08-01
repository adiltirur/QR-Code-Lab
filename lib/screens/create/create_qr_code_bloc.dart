import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/error/creation_error.dart';
import '../../core/services/bloc.dart';
import '../../repository/scanner/scanner_repository.dart';
import 'create_qr_code_state.dart';

extension on QRCodeItem {
  String get getPreFixValue {
    switch (this) {
      case QRCodeItem.text:
        return '';
      case QRCodeItem.email:
        return 'mailto:';
      case QRCodeItem.url:
        return 'https://';
      case QRCodeItem.phone:
        return 'tel:';
    }
  }
}

class CreateQRCodeBloc extends GSBloc<CreateQRCodeState, CreateQRCodeEvent> {
  final _scannerRepository = ScannerRepository();
  void updateQRType(QRCodeItem type) {
    emitS(
      state: currentState.copyWith(
        type: type,
      ),
    );
  }

  void updateQRText(String? text) {
    emitS(
      state: currentState.copyWith(
        text: text,
      ),
    );
  }

  void onCreate(QRCodeItem type, String text) {
    if (text.isNotEmpty) {
      executeSafely(
        () async {
          final scannedInfo = await _scannerRepository.getScannedInfo(
            Barcode(rawValue: type.getPreFixValue + text),
            null,
            title: text,
          );
          emitS(
            events: [CreateQRCodeEvent.created(scannedInfo: scannedInfo)],
          );
        },
      );
    } else {
      emitS(error: CreationError(tr('general.error.required_error')));
    }
  }

  Future<void> onDeleteItem(String uuid) async {
    emitS(isLoading: true);
    await _scannerRepository.deleteItem(uuid);
    emitS(
      isLoading: false,
    );
  }

  void onBackFromDetailsPage() {
    emitS(
      state: currentState.copyWith(
        text: null,
      ),
    );
    emitS(
      events: [const CreateQRCodeEvent.onBack()],
    );
  }

  CreateQRCodeBloc()
      : super(
          const CreateQRCodeState(
            text: null,
            type: QRCodeItem.text,
          ),
        );
}
