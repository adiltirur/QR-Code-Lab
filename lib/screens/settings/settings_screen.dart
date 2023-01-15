import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/extensions/list.dart';
import '../../core/routes/router.dart';
import '../../core/ui/components/bloc_master.dart';
import '../../core/ui/components/dialogs/dialog_displayer.dart';
import '../../core/ui/components/radio_list.dart';
import '../../core/ui/components/separated_unscrollable_list.dart';
import '../../core/ui/components/text_buttons.dart';
import '../home/home_bloc.dart';
import '../home/home_screen.dart';

extension on CameraFacing {
  String get titleText {
    switch (this) {
      case CameraFacing.front:
        return 'settings.camera_front';

      case CameraFacing.back:
        return 'settings.camera_back';
    }
  }
}

class SettingsScreen extends StatelessWidget {
  Widget _buildDeleteButton(BuildContext context) {
    return WBTextButton(
      text: 'settings.delete_history_button'.tr(),
      onPressed: () async {
        final answer = await showTextYesNoDialog(
          context,
          tr('settings.delete_history_confirmation_msg'),
        );
        if (answer) context.bloc<HomeBloc>().deleteScanHistory();
      },
      color: WBColors.red,
    );
  }

  Widget _buildLanguageButton(BuildContext context) {
    return WBListButton(
      title: 'settings.change_language_title'.tr(),
      onTap: () => context.router.push(
        LanguageScreenRoute(
          onChangeLanguage: context.bloc<HomeBloc>().updateLanguage,
        ),
      ),
    );
  }

  RadioListItem<CameraFacing> _buildCameraItem(CameraFacing cameraFacing) {
    return RadioListItem<CameraFacing>(
      value: cameraFacing,
      text: cameraFacing.titleText.tr(),
    );
  }

  Widget _buildCameraButton(BuildContext context, CameraFacing cameraFacing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: const Text(
            'settings.select_camera_title',
            style: TextStyle(
              fontSize: 16,
            ),
          ).tr(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioList<CameraFacing>(
            items: CameraFacing.values.mapToList(_buildCameraItem),
            value: cameraFacing,
            onChanged: (cameraFacing) {
              context.bloc<HomeBloc>().updateDefaultCamera(cameraFacing);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSaveImageSwitch(
    BuildContext context,
    bool value,
  ) {
    return WBListSwitch(
      title: tr('settings.save_image'),
      value: value,
      onChanged: (switchValue) {
        context.bloc<HomeBloc>().updateSaveImage(switchValue);
      },
    );
  }

  Text _buildTitle() {
    return const Text(
      'bottom_navigation.settings',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: WBColors.white,
      ),
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    HomeBlocOutput output,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WBColors.primary,
        centerTitle: false,
        title: _buildTitle().tr(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SeparatedUnScrollableList(
            children: [
              _buildLanguageButton(context),
              _buildSaveImageSwitch(
                context,
                output.state.systemSettings.shouldSaveImage,
              ),
              _buildCameraButton(
                context,
                output.state.systemSettings.defaultCamera,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildDeleteButton(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WBBlocConsumer<HomeBloc, HomeBlocOutput>(
      builder: _blocBuilder,
      useDialogDisplayer: false,
    );
  }
}
