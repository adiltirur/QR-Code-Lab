import 'package:hive/hive.dart';

import '../../core/services/bloc.dart';
import '../../repository/scanner/models/hive_scanned_item.dart';
import '../../repository/scanner/scanner_repository.dart';
import 'scan_history_state.dart';

class ScanHistoryBloc extends WBBloc<ScanHistoryState, ScanHistoryEvent> {
  final _scannerRepository = ScannerRepository();
  Future<void> _init() async {
    final box = await Hive.openBox<HiveScannedItem>('scanHistory');
    emitS(
      state: currentState.copyWith(
        scannedItems: box.values.toList()
          ..sort(
            (a, b) => b.createdAt.compareTo(a.createdAt),
          ),
      ),
    );
  }

  void onTapScannedItem(HiveScannedItem hiveScannedItem) {
    final scannedInfo =
        _scannerRepository.getScannedInfoFromHive(hiveScannedItem);
    emitS(events: [ScanHistoryEvent.open(scannedInfo: scannedInfo)]);
  }

  Future<void> onDeleteItem(String uuid) async {
    emitS(isLoading: true);
    final box = await Hive.openBox<HiveScannedItem>('scanHistory');
    box.delete(uuid);
    emitS(
      isLoading: false,
      state: currentState.copyWith(
        scannedItems: box.values.toList(),
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

  ScanHistoryBloc()
      : super(
          const ScanHistoryState(scannedItems: [], reverseList: false),
        ) {
    _init();
  }
}
