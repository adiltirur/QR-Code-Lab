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
import '../create/create_qr_code_screen.dart';
import '../scan/scan_screen.dart';
import '../scan_history/scan_history_screen.dart';
import '../settings/settings_screen.dart';

import 'home_bloc.dart';
import 'home_state.dart';

typedef HomeBlocOutput = GSBlocOutput<HomeState, HomeEvent>;

extension on GSBottomNavigationItem {
  Widget screen(SystemSettings systemSettings) {
    switch (this) {
      case GSBottomNavigationItem.create:
        return CreateQRCode();
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
      case GSBottomNavigationItem.create:
        return _buildBottomNavigationItem(
          Icons.qr_code_scanner_sharp,
          tr('bottom_navigation.create'),
        );
      case GSBottomNavigationItem.scan:
        return _buildBottomNavigationItem(
          Icons.document_scanner_rounded,
          tr('bottom_navigation.scan'),
        );
      case GSBottomNavigationItem.history:
        return _buildBottomNavigationItem(
          Icons.history,
          tr('bottom_navigation.history'),
        );

      case GSBottomNavigationItem.settings:
        return _buildBottomNavigationItem(
          Icons.settings,
          tr('bottom_navigation.settings'),
        );
    }
  }
}

BottomNavigationBarItem _buildBottomNavigationItem(
    IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      size: 34,
    ),
    label: label,
  );
}

class HomeScreen extends StatelessWidget {
  Widget _blocBuilder(BuildContext context, HomeBlocOutput output) {
    final isDarkMode = output.state.systemSettings.isDarkMode;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDarkMode ? GSColors.black : GSColors.white,
        selectedFontSize: 12.0,
        items: GSBottomNavigationItem.values.mapToList(
          (e) => e.navigationItem,
        ),
        selectedIconTheme: const IconThemeData(fill: 1.0),
        unselectedIconTheme: const IconThemeData(fill: 0.0),
        currentIndex: output.state.selectedItem.index,
        selectedItemColor: isDarkMode ? GSColors.white : GSColors.primary,
        unselectedItemColor:
            isDarkMode ? GSColors.white.withOpacity(0.5) : GSColors.grey,
        iconSize: 24,
        showUnselectedLabels: true,
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
    return GSBlocConsumer<HomeBloc, HomeBlocOutput>(
      builder: _blocBuilder,
      listener: _blocListener,
      useScreenLoader: true,
    );
  }
}
