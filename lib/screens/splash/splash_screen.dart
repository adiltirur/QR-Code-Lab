import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/const/flavors.dart';
import '../../core/routes/router.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';
import 'splash_bloc.dart';
import 'splash_state.dart';

typedef _BlocOutput = WBBlocOutput<SplashState, SplashEvent>;

class SplashScreen extends StatelessWidget {
  Widget _blocBuilder(BuildContext context, _BlocOutput output) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/animations/splash.json',
          width: 84,
          height: 84,
        ),
        Text(
          F.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _blocListener(BuildContext context, _BlocOutput output) {
    for (final event in output.events) {
      event.when<void>(
        done: (systemSettings) {
          context.router.replace(
            HomeScreenRoute(systemSettings: systemSettings),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocMaster<SplashBloc, _BlocOutput>(
        create: (_) => SplashBloc(),
        builder: _blocBuilder,
        listener: _blocListener,
        useScreenLoader: false,
      ),
    );
  }
}
