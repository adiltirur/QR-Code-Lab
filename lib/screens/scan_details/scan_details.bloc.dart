import '../../core/services/bloc.dart';
import 'scan_details_state.dart';

class ScanDetailsBloc extends WBBloc<ScanDetailsState, ScanDetailsEvent> {
  void onDelete() {
    emitS(events: [const ScanDetailsEvent.delete()]);
  }

  ScanDetailsBloc()
      : super(
          const ScanDetailsState(customName: '', note: ''),
        );
}
