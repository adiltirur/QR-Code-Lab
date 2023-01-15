import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/globals/url_launcher.dart';
import '../../core/models/notification.dart';
import '../../core/models/scanned_info.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';
import '../../core/ui/components/dialogs/dialog_displayer.dart';
import '../../core/ui/components/text_buttons.dart';
import 'scan_details.bloc.dart';
import 'scan_details_state.dart';

typedef _BlocOutput = WBBlocOutput<ScanDetailsState, ScanDetailsEvent>;

class ScanDetails extends StatelessWidget {
  final ScannedInfo scannedInfo;
  final void Function(String uuid) onDelete;

  const ScanDetails({
    super.key,
    required this.scannedInfo,
    required this.onDelete,
  });

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
  ) {
    var qrCode = scannedInfo.qrCode;
    var bool = scannedInfo.barCode.rawValue == scannedInfo.barCode.displayValue;
    return WillPopScope(
      onWillPop: () async {
        if (!Navigator.of(context).userGestureInProgress) {
          context.router.pop(true);
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: WBColors.white,
          leading: BackButton(
            color: WBColors.black,
            onPressed: () => context.router.pop(true),
          ),
          actions: [
            IconButton(
              onPressed: () => context.bloc<ScanDetailsBloc>().onDelete(),
              icon: const Icon(
                Icons.delete,
                color: WBColors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (qrCode != null) ...[
                const SizedBox(
                  height: 32,
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Image.memory(
                    qrCode,
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
              if (bool) ...[
                Text(scannedInfo.barCode.rawValue ?? ''),
                WBTextButton(
                    text: 'Open QR Code',
                    onPressed: () =>
                        tryLaunchUrlString(scannedInfo.barCode.rawValue)),
              ] else ...[
                WBTextButton(
                    text: 'Open QR Code',
                    onPressed: () =>
                        tryLaunchUrlString(scannedInfo.barCode.rawValue)),
                Text(scannedInfo.barCode.rawValue ?? ''),
                Text(scannedInfo.barCode.displayValue ?? ''),
              ],
              const SizedBox(
                height: 32,
              ),
              const Text('Add more details here:'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleDelete(BuildContext context) async {
    final answer = await showTextYesNoDialog(
      context,
      'Are you sure?',
    );
    if (answer) {
      onDelete(scannedInfo.uuid);
      context.dialogDisplayer.showAlert(
        type: WBNotificationType.confirmation,
        body: 'Deleted!',
      );
      context.router.pop();
    }
  }

  void _blocListener(
    BuildContext context,
    _BlocOutput output,
  ) {
    for (final event in output.events) {
      event.when<void>(
        delete: () => _handleDelete(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocMaster<ScanDetailsBloc, _BlocOutput>(
      create: (_) => ScanDetailsBloc(),
      builder: _blocBuilder,
      listener: _blocListener,
      useScreenLoader: true,
    );
  }
}
