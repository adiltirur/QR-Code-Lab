import 'package:auto_route/auto_route.dart';
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
        return 'Front';

      case CameraFacing.back:
        return 'Back';
    }
  }
}

class SettingsScreen extends StatelessWidget {
  Widget _buildDeleteButton(BuildContext context) {
    return WBTextButton(
      text: 'Delete Scan History',
      onPressed: () async {
        final answer = await showTextYesNoDialog(
          context,
          'This will delete All Scan History, are you sure?',
        );
        if (answer) context.bloc<HomeBloc>().deleteScanHistory();
      },
      color: WBColors.red,
    );
  }

  Widget _buildLanguageButton(BuildContext context) {
    return WBListButton(
      title: 'Change Language',
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
      text: cameraFacing.titleText,
    );
  }

  Widget _buildCameraButton(BuildContext context, CameraFacing cameraFacing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text('Select Default Camera'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioList<CameraFacing>(
            items: CameraFacing.values.mapToList(_buildCameraItem),
            value: cameraFacing,
            onChanged: (cameraFacing) =>
                context.bloc<HomeBloc>().updateDefaultCamera(cameraFacing),
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
      title: 'Save Image on Scan',
      value: value,
      onChanged: (switchValue) =>
          context.bloc<HomeBloc>().updateSaveImage(switchValue),
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
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: WBColors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SeparatedUnScrollableList(
            children: [
              _buildCameraButton(
                context,
                output.state.systemSettings.defaultCamera,
              ),
              _buildSaveImageSwitch(
                context,
                output.state.systemSettings.shouldSaveImage,
              ),
              _buildLanguageButton(context),
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
