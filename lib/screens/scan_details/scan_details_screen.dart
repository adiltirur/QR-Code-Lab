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
import '../../core/ui/components/image_dialog.dart';
import '../../core/ui/components/text_buttons.dart';
import 'scan_details.bloc.dart';
import 'scan_details_state.dart';

typedef _BlocOutput = GSBlocOutput<ScanDetailsState, ScanDetailsEvent>;

class ScanDetails extends HookWidget {
  final ScannedInfo scannedInfo;
  final void Function(String uuid) onDelete;
  final void Function() onBack;

  const ScanDetails({
    required this.scannedInfo,
    required this.onDelete,
    required this.onBack,
  });

  Widget _openImage(BuildContext context, Uint8List qrCode) {
    return GSTextButton(
      text: tr('scan_details.open_image'),
      onPressed: () async {
        await showDialog(
            context: context,
            builder: (_) => ImageDialog(
                  image: qrCode,
                ));
      },
      color: GSColors.black,
    );
  }

  Widget _buildUrlLaunchButton(BuildContext context) {
    return GSTextButton(
      text: tr('scan_details.launch_url'),
      onPressed: () async {
        final isSuccess =
            await tryLaunchUrlString(scannedInfo.barCode.rawValue);
        if (!isSuccess) context.bloc<ScanDetailsBloc>().hasError();
      },
      color: GSColors.primary,
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

  List<Widget> _buildImage(Uint8List qrCode, BuildContext context) {
    return [
      const SizedBox(height: 32),
      CircleAvatar(
        radius: 80,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: RotatedBox(
            quarterTurns: 1,
            child: Image.memory(
              qrCode,
              height: 150.0,
              width: 150.0,
              fit: BoxFit.cover,
            ),
          ),
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
        color: GSColors.white,
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
        onBack();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: _buildBottomAppBar(context),
        appBar: AppBar(
          backgroundColor: GSColors.primary,
          leading: BackButton(
            color: GSColors.white,
            onPressed: () => onBack(),
          ),
          actions: [_buildDeleteRecord(context)],
        ),
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              children: [
                if (qrCode != null) ..._buildImage(qrCode, context),
                const Text(
                  'scan_details.code_info',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ).tr(),
                ..._buildRawValue(context),
                const SizedBox(height: 32),
                if (qrCode != null) _openImage(context, qrCode)
              ],
            )),
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
        type: GSNotificationType.confirmation,
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
