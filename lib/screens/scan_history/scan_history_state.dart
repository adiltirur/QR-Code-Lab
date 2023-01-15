import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/models/scanned_info.dart';
import '../../repository/scanner/models/hive_scanned_item.dart';

part 'scan_history_state.freezed.dart';

@freezed
class ScanHistoryEvent with _$ScanHistoryEvent {
  const factory ScanHistoryEvent.open({
    required ScannedInfo scannedInfo,
  }) = ScanHistoryOpenEvent;
  const factory ScanHistoryEvent.onBack() = ScanHistoryOnBackEvent;
}

@freezed
class ScanHistoryState with _$ScanHistoryState {
  const factory ScanHistoryState({
    required List<HiveScannedItem> scannedItems,
    required bool reverseList,
  }) = _ScanHistoryState;
}
