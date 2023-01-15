import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_details_state.freezed.dart';

@freezed
class ScanDetailsEvent with _$ScanDetailsEvent {
  const factory ScanDetailsEvent.delete() = ScanDetailsDeleteEvent;
}

@freezed
class ScanDetailsState with _$ScanDetailsState {
  const factory ScanDetailsState() = _ScanDetailsState;
}
