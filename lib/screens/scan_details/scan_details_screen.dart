import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

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
import '../home/home_bloc.dart';
import 'scan_details.bloc.dart';
import 'scan_details_state.dart';

typedef _BlocOutput = GSBlocOutput<ScanDetailsState, ScanDetailsEvent>;

@RoutePage()
class ScanDetails extends StatelessWidget {
  final ScannedInfo scannedInfo;
  final void Function(String uuid) onDelete;
  final void Function() onBack;

  const ScanDetails({
    required this.scannedInfo,
    required this.onDelete,
    required this.onBack,
  });

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

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/gradsprint/gradsprint.jpg');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  List<Widget> _buildImage(String value, bool isDarkMode) {
    return [
      const SizedBox(height: 32),
      Center(child: _buildQRImage(value, isDarkMode)),
      const SizedBox(height: 32),
    ];
  }

  FutureBuilder<ui.Image> _buildQRImage(String value, bool isDarkMode) {
    return FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        const size = 320.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: _buildQRCode(value, snapshot.data, isDarkMode),
        );
      },
    );
  }

  QrPainter _buildQRCode(
    String data,
    ui.Image? image,
    bool isDarkMode,
  ) {
    var color = isDarkMode ? GSColors.white : GSColors.black;
    return QrPainter(
      data: data,
      version: QrVersions.auto,
      eyeStyle: QrEyeStyle(
        eyeShape: QrEyeShape.circle,
        color: color,
      ),
      errorCorrectionLevel: QrErrorCorrectLevel.Q,
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.circle,
        color: color,
      ),
      embeddedImage: image,
      embeddedImageStyle: const QrEmbeddedImageStyle(
        size: Size.square(80),
      ),
    );
  }

  Widget _buildShareButton(BuildContext context, bool isDarkMode) {
    return IconButton(
      onPressed: () async {
        var rawValue = scannedInfo.barCode.rawValue;
        if (rawValue != null) {
          final overlayImage = await _buildQRImage(rawValue, isDarkMode).future;
          final image = await _buildQRCode(rawValue, overlayImage, isDarkMode)
              .toImageData(360);
          final bytes = image?.buffer.asUint8List();
          if (bytes != null) {
            final tempDir = await getTemporaryDirectory();
            final file = File('${tempDir.path}/qr.png');
            await file.writeAsBytes(bytes);

            Share.shareXFiles(
              [XFile(file.path)],
              subject: tr('scan_details.share_subject'),
            );
          }
        }
      },
      icon: const Icon(
        Icons.share,
        color: GSColors.white,
      ),
    );
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
    bool isDarkMode,
  ) {
    final rawValue = scannedInfo.barCode.rawValue;

    return WillPopScope(
      onWillPop: () async {
        onBack();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: _buildBottomAppBar(context),
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => onBack(),
          ),
          actions: [
            _buildShareButton(context, isDarkMode),
            _buildDeleteRecord(context),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: ListView(
              children: [
                if (rawValue != null) ..._buildImage(rawValue, isDarkMode),
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
    final isDarkMode =
        context.bloc<HomeBloc>().currentState.systemSettings.isDarkMode;
    return BlocMaster<ScanDetailsBloc, _BlocOutput>(
      create: (_) => ScanDetailsBloc(),
      builder: (context, output) => _blocBuilder(context, output, isDarkMode),
      listener: _blocListener,
      useScreenLoader: true,
    );
  }
}
