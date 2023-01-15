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

typedef HomeBlocOutput = WBBlocOutput<HomeState, HomeEvent>;

extension on WBBottomNavigationItem {
  Widget screen(SystemSettings systemSettings) {
    switch (this) {
      case WBBottomNavigationItem.scan:
        return ScanScreen(systemSettings: systemSettings);
      case WBBottomNavigationItem.history:
        return ScanHistoryScreen();
      case WBBottomNavigationItem.settings:
        return SettingsScreen();
    }
  }

  BottomNavigationBarItem get navigationItem {
    switch (this) {
      case WBBottomNavigationItem.scan:
        return const BottomNavigationBarItem(
          icon: Icon(
            Icons.qr_code,
            size: 34,
          ),
          label: 'Scan',
        );
      case WBBottomNavigationItem.history:
        return const BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            size: 34,
          ),
          label: 'History',
        );
      case WBBottomNavigationItem.settings:
        return const BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 34,
          ),
          label: 'Settings',
        );
    }
  }
}

class HomeScreen extends StatelessWidget {
  final SystemSettings? systemSettings;

  const HomeScreen({super.key, this.systemSettings});

  Widget _blocBuilder(BuildContext context, HomeBlocOutput output) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: WBColors.white,
        elevation: 0,
        selectedFontSize: 12.0,
        items: WBBottomNavigationItem.values.mapToList(
          (e) => e.navigationItem,
        ),
        currentIndex: output.state.selectedItem.index,
        selectedItemColor: WBColors.primary,
        unselectedItemColor: WBColors.grey,
        onTap: (value) => context.bloc<HomeBloc>().onTapBottomNavigationBar(
              WBBottomNavigationItem.values[value],
            ),
      ),
      body: WBBottomNavigationItem.values
          .elementAt(output.state.selectedItem.index)
          .screen(output.state.systemSettings),
    );
  }

  void _blocListener(BuildContext context, HomeBlocOutput output) {
    for (final event in output.events) {
      event.when<void>(deleted: () {
        context.dialogDisplayer.showAlert(
          type: WBNotificationType.confirmation,
          body: 'All History Deleted!',
        );
      });
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
