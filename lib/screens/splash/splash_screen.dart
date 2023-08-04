import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/const/flavors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/routes/router.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';
import '../home/home_bloc.dart';
import 'splash_bloc.dart';
import 'splash_state.dart';

typedef _BlocOutput = GSBlocOutput<SplashState, SplashEvent>;

class SplashScreen extends StatelessWidget {
  Widget _buildAppName() {
    return Text(
      F.title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildAnimation(bool isDarkMode) {
    return Lottie.asset(
      'assets/animations/${isDarkMode ? 'loader_dark' : 'loader'}.json',
      width: 84,
      height: 84,
    );
  }

  Widget _blocBuilder(
      BuildContext context, _BlocOutput output, bool isDarkMode) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAnimation(isDarkMode),
        _buildAppName(),
      ],
    );
  }

  void _blocListener(BuildContext context, _BlocOutput output) {
    for (final event in output.events) {
      event.when<void>(
        done: (systemSettings) {
          final isDarkMode = systemSettings != null
              ? systemSettings.isDarkMode
              : context.isDarkMode;
          context.bloc<HomeBloc>().updateTheme(isDarkMode);
          context.router.replace(
            const HomeScreenRoute(),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Scaffold(
      body: BlocMaster<SplashBloc, _BlocOutput>(
        create: (_) => SplashBloc(),
        builder: (context, output) => _blocBuilder(context, output, isDarkMode),
        listener: _blocListener,
        useScreenLoader: false,
      ),
    );
  }
}
