import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

import '../splash/splash_screen.dart';
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

  NavigationRailDestination get navigationRailItem {
    switch (this) {
      case GSBottomNavigationItem.create:
        return _buildNavigationRailItem(
          Icons.home,
          tr('bottom_navigation.create'),
        );
      case GSBottomNavigationItem.scan:
        return _buildNavigationRailItem(
          Icons.car_rental,
          tr('bottom_navigation.scan'),
        );
      case GSBottomNavigationItem.history:
        return _buildNavigationRailItem(
          Icons.car_repair_sharp,
          tr('bottom_navigation.history'),
        );
      case GSBottomNavigationItem.settings:
        return _buildNavigationRailItem(
          Icons.person,
          tr('bottom_navigation.settings'),
        );
    }
  }
}

NavigationRailDestination _buildNavigationRailItem(
  IconData icon,
  String label,
) {
  return NavigationRailDestination(
    icon: Icon(
      icon,
      size: 34,
    ),
    label: Text(label),
  );
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

@RoutePage()
class HomeScreen extends HookWidget {
  Widget _blocBuilder(
    BuildContext context,
    HomeBlocOutput output,
    AppLifecycleState? lifecycleState,
  ) {
    final isDarkMode = output.state.systemSettings.isDarkMode;
    switch (lifecycleState) {
      case AppLifecycleState.inactive:
        context.bloc<HomeBloc>().toggleAppStatus(false);
      default:
        context.bloc<HomeBloc>().toggleAppStatus(true);
    }
    final isActive = output.state.isActive;
    return isActive
        ? Scaffold(
            /*       bottomNavigationBar: BottomNavigationBar(
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
            ), */
            body: Row(
              children: [
                _buildNavigationRail(context, output.state),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: GSBottomNavigationItem.values
                      .elementAt(output.state.selectedItem.index)
                      .screen(output.state.systemSettings),
                ),
              ],
            ),
          )
        : const SplashScreen(showAnimation: false);
  }

  NavigationRail _buildNavigationRail(BuildContext context, HomeState state) {
    return NavigationRail(
      selectedIndex: state.selectedItem.index,
      groupAlignment: -1.0,
      indicatorColor: Colors.transparent,
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      onDestinationSelected: (index) {
        context
            .bloc<HomeBloc>()
            .onTapBottomNavigationBar(GSBottomNavigationItem.values[index]);
      },
      labelType: NavigationRailLabelType.all,
      destinations: GSBottomNavigationItem.values.mapToList(
        (e) => e.navigationRailItem,
      ),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              )),
        ),
      ),
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
    final lifecycleState = useAppLifecycleState();

    return GSBlocConsumer<HomeBloc, HomeBlocOutput>(
      builder: (context, output) => _blocBuilder(
        context,
        output,
        lifecycleState,
      ),
      listener: _blocListener,
      useScreenLoader: true,
    );
  }
}
