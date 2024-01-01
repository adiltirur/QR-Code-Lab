import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/scan_details/scan_details_screen.dart';

import '../../screens/settings/language_screen.dart';
import '../../screens/splash/splash_screen.dart';
import '../models/language.dart';
import '../models/scanned_info.dart';
import 'navigation_path.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route,Screen')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          path: NavigationPath.splash,
          page: SplashScreenRoute.page,
        ),
        AutoRoute(
          path: NavigationPath.home,
          page: HomeScreenRoute.page,
        ),
        AutoRoute(
          path: NavigationPath.scanDetails,
          page: ScanDetailsRoute.page,
        ),
        AutoRoute(
          path: NavigationPath.language,
          page: LanguageScreenRoute.page,
        ),
      ];
}
