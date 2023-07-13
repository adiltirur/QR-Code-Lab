import 'package:hive/hive.dart';

import '../../core/const/hive_boxes.dart';
import '../../core/services/bloc.dart';
import '../../repository/scanner/models/hive_scanned_item.dart';
import '../../repository/scanner/scanner_repository.dart';
import 'scan_history_state.dart';

class ScanHistoryBloc extends GSBloc<ScanHistoryState, ScanHistoryEvent> {
  final _scannerRepository = ScannerRepository();

  void onBackFromDetailsPage() {
    emitS(
      events: [
        const ScanHistoryEvent.onBack(),
      ],
    );
  }

  void onTapScannedItem(HiveScannedItem hiveScannedItem) {
    final scannedInfo = _scannerRepository.getScannedInfoFromHive(
      hiveScannedItem,
    );
    emitS(
      events: [
        ScanHistoryEvent.open(scannedInfo: scannedInfo),
      ],
    );
  }

  Future<void> onDeleteItem(String uuid) async {
    emitS(isLoading: true);
    final scannedItemsAfterDelete = await _scannerRepository.deleteItem(uuid);
    emitS(
      isLoading: false,
      state: currentState.copyWith(
        scannedItems: scannedItemsAfterDelete,
      ),
    );
  }

  Future<void> onToggleReverseList() async {
    emitS(
      isLoading: false,
      state: currentState.copyWith(
        reverseList: !currentState.reverseList,
      ),
    );
  }

  Future<void> _init() async {
    emitS(isLoading: true);
    final box = await Hive.openBox<HiveScannedItem>(GSHiveNames.scanHistory);
    emitS(
      state: currentState.copyWith(
        scannedItems: box.values.toList()
          ..sort(
            (a, b) => b.createdAt.compareTo(a.createdAt),
          ),
      ),
      isLoading: false,
    );
  }

  ScanHistoryBloc()
      : super(
          const ScanHistoryState(
            scannedItems: [],
            reverseList: false,
          ),
        ) {
    _init();
  }
}
