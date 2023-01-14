import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/extensions/list.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';

import '../scan/scan_screen.dart';
import '../scan_history/scan_history_screen.dart';
import '../settings/settings.dart';

import 'home_bloc.dart';
import 'home_state.dart';

typedef _BlocOutput = WBBlocOutput<HomeState, HomeEvent>;

extension on WBBottomNavigationItem {
  Widget get screen {
    switch (this) {
      case WBBottomNavigationItem.scan:
        return ScanScreen();
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
  const HomeScreen({super.key});

  Widget _blocBuilder(BuildContext context, _BlocOutput output) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: WBColors.white,
        elevation: 0,
        selectedFontSize: 12.0,
        items: WBBottomNavigationItem.values.mapToList(
          (e) => e.navigationItem,
        ),
        currentIndex: output.state.selectedItem.index,
        selectedItemColor: WBColors.black,
        unselectedItemColor: WBColors.grey,
        onTap: (value) => context.bloc<HomeBloc>().onTapBottomNavigationBar(
              WBBottomNavigationItem.values[value],
            ),
      ),
      body: WBBottomNavigationItem.values
          .elementAt(output.state.selectedItem.index)
          .screen,
    );
  }

  void _blocListener(BuildContext context, _BlocOutput output) {
    for (final event in output.events) {
      event.when<void>(loading: () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocMaster<HomeBloc, _BlocOutput>(
      create: (_) => HomeBloc(),
      builder: _blocBuilder,
      listener: _blocListener,
      useScreenLoader: true,
    );
  }
}
