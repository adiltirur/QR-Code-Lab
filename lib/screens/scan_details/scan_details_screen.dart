import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/extensions/date_time.dart';
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
  final void Function() onBack;

  const ScanDetails({
    required this.scannedInfo,
    required this.onDelete,
    required this.onBack,
  });
  Widget _buildUrlLaunchButton(BuildContext context) {
    return WBTextButton(
      text: tr('scan_details.launch_url'),
      onPressed: () async {
        final isSuccess =
            await tryLaunchUrlString(scannedInfo.barCode.rawValue);
        if (!isSuccess) context.bloc<ScanDetailsBloc>().hasError();
      },
      color: WBColors.black,
    );
  }

  List<Widget> _buildRawValue(BuildContext context) {
    return [
      Text(
        scannedInfo.barCode.rawValue ?? '',
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 32),
      _buildUrlLaunchButton(context)
    ];
  }

  List<Widget> _buildImage(Uint8List qrCode) {
    return [
      const SizedBox(height: 32),
      RotatedBox(
        quarterTurns: 1,
        child: Image.memory(
          qrCode,
          width: 150,
          height: 150,
        ),
      ),
      const SizedBox(height: 32),
    ];
  }

  Widget _buildDeleteRecord(BuildContext context) {
    return IconButton(
      onPressed: () => context.bloc<ScanDetailsBloc>().onDelete(),
      icon: const Icon(
        Icons.delete,
        color: WBColors.white,
      ),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('scan_details.created_on').tr(
            namedArgs: {
              'date': scannedInfo.createdAt.formattedDate,
            },
          ),
        ],
      ),
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
  ) {
    final qrCode = scannedInfo.qrCode;

    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: _buildBottomAppBar(context),
        appBar: AppBar(
          backgroundColor: WBColors.primary,
          leading: BackButton(
            color: WBColors.white,
            onPressed: () => onBack(),
          ),
          actions: [_buildDeleteRecord(context)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (qrCode != null) ..._buildImage(qrCode),
              const Text(
                'scan_details.code_info',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ).tr(),
              ..._buildRawValue(context),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleDelete(BuildContext context) async {
    final answer = await showTextYesNoDialog(
      context,
      tr('scan_details.delete_confirmation_msg'),
    );
    if (answer) {
      onDelete(scannedInfo.uuid);
      context.dialogDisplayer.showAlert(
        type: WBNotificationType.confirmation,
        body: tr('general.deleted'),
      );
      onBack();
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
