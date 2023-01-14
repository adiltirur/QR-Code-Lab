import 'package:auto_route/auto_route.dart';

import '../../screens/splash/splash_screen.dart';
import 'navigation_path.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      path: NavigationPath.splash,
      page: SplashScreen,
      initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
