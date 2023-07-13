import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/extensions/list.dart';
import '../../core/models/notification.dart';
import '../../core/models/system_settings.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';

import '../../core/ui/components/dialogs/dialog_displayer.dart';
import '../scan/scan_screen.dart';
import '../scan_history/scan_history_screen.dart';
import '../settings/settings_screen.dart';

import 'home_bloc.dart';
import 'home_state.dart';

typedef HomeBlocOutput = GSBlocOutput<HomeState, HomeEvent>;

extension on GSBottomNavigationItem {
  Widget screen(SystemSettings systemSettings) {
    switch (this) {
      case GSBottomNavigationItem.scan:
        return ScanScreen(systemSettings: systemSettings);
      case GSBottomNavigationItem.history:
        return ScanHistoryScreen();
      case GSBottomNavigationItem.settings:
        return SettingsScreen();
    }
  }

  BottomNavigationBarItem get navigationItem {
    switch (this) {
      case GSBottomNavigationItem.scan:
        return BottomNavigationBarItem(
          icon: const Icon(
            Icons.qr_code,
            size: 34,
          ),
          label: tr('bottom_navigation.scan'),
        );
      case GSBottomNavigationItem.history:
        return BottomNavigationBarItem(
          icon: const Icon(
            Icons.history,
            size: 34,
          ),
          label: tr('bottom_navigation.history'),
        );
      case GSBottomNavigationItem.settings:
        return BottomNavigationBarItem(
          icon: const Icon(
            Icons.settings,
            size: 34,
          ),
          label: tr('bottom_navigation.settings'),
        );
    }
  }
}

class HomeScreen extends StatelessWidget {
  final SystemSettings? systemSettings;

  const HomeScreen({this.systemSettings});

  Widget _blocBuilder(BuildContext context, HomeBlocOutput output) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: GSColors.white,
        selectedFontSize: 12.0,
        items: GSBottomNavigationItem.values.mapToList(
          (e) => e.navigationItem,
        ),
        currentIndex: output.state.selectedItem.index,
        selectedItemColor: GSColors.primary,
        unselectedItemColor: GSColors.grey,
        onTap: (value) {
          context.bloc<HomeBloc>().onTapBottomNavigationBar(
                GSBottomNavigationItem.values[value],
              );
        },
      ),
      body: GSBottomNavigationItem.values
          .elementAt(output.state.selectedItem.index)
          .screen(output.state.systemSettings),
    );
  }

  Future<void> _showDeletedAlert(BuildContext context) {
    return context.dialogDisplayer.showAlert(
      type: GSNotificationType.confirmation,
      body: tr('settings.history_deleted'),
    );
  }

  void _blocListener(BuildContext context, HomeBlocOutput output) {
    for (final event in output.events) {
      event.when<void>(
        deleted: () => _showDeletedAlert(
          context,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocMaster<HomeBloc, HomeBlocOutput>(
      create: (_) => HomeBloc(systemSettings: systemSettings),
      builder: _blocBuilder,
      listener: _blocListener,
      useScreenLoader: true,
    );
  }
}
