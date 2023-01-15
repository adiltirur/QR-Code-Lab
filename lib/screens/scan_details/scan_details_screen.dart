import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class ScanDetails extends HookWidget {
  final ScannedInfo scannedInfo;
  final void Function(String uuid) onDelete;

  ScanDetails({
    required this.scannedInfo,
    required this.onDelete,
  });
  final _formKey = GlobalKey<FormState>();

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Created on: ${scannedInfo.createdAt.toIso8601String()}'),
        ],
      ),
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
  ) {
    var qrCode = scannedInfo.qrCode;
    var isRawAndDisplayHaveSameValue =
        scannedInfo.barCode.rawValue == scannedInfo.barCode.displayValue;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildBottomAppBar(context),
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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
            const Text('QR Code Info:-'),
            if (isRawAndDisplayHaveSameValue) ...[
              Text(scannedInfo.barCode.rawValue ?? ''),
              const SizedBox(
                height: 32,
              ),
              WBTextButton(
                  text: 'Open QR Code',
                  onPressed: () =>
                      tryLaunchUrlString(scannedInfo.barCode.rawValue)),
            ] else ...[
              Text(scannedInfo.barCode.rawValue ?? ''),
              const SizedBox(
                height: 32,
              ),
              Text(scannedInfo.barCode.displayValue ?? ''),
              const SizedBox(
                height: 32,
              ),
              WBTextButton(
                  text: 'Open QR Code',
                  onPressed: () async {
                    final isSuccess =
                        await tryLaunchUrlString(scannedInfo.barCode.rawValue);
                    if (!isSuccess) context.bloc<ScanDetailsBloc>().hasError();
                  }),
            ],
            const SizedBox(
              height: 32,
            ),
          ],
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
