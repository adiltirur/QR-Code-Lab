import 'package:easy_localization/easy_localization.dart';

import '../../core/error/url_opening_error.dart';
import '../../core/services/bloc.dart';
import 'scan_details_state.dart';

class ScanDetailsBloc extends WBBloc<ScanDetailsState, ScanDetailsEvent> {
  void onDelete() {
    emitS(events: [const ScanDetailsEvent.delete()]);
  }

  void hasError() {
    emitS(error: UrlOpeningError(tr('general.error.unknown')));
  }

  ScanDetailsBloc()
      : super(
          const ScanDetailsState(),
        );
}
