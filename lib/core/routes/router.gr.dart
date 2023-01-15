// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeScreen(
          key: args.key,
          systemSettings: args.systemSettings,
        ),
      );
    },
    ScanDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ScanDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ScanDetails(
          key: args.key,
          scannedInfo: args.scannedInfo,
          onDelete: args.onDelete,
        ),
      );
    },
    LanguageScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageScreenRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LanguageScreen(
          key: args.key,
          onChangeLanguage: args.onChangeLanguage,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomeScreenRoute.name,
          path: 'home',
        ),
        RouteConfig(
          ScanDetailsRoute.name,
          path: 'scanDetails',
        ),
        RouteConfig(
          LanguageScreenRoute.name,
          path: 'language',
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    Key? key,
    SystemSettings? systemSettings,
  }) : super(
          HomeScreenRoute.name,
          path: 'home',
          args: HomeScreenRouteArgs(
            key: key,
            systemSettings: systemSettings,
          ),
        );

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    this.key,
    this.systemSettings,
  });

  final Key? key;

  final SystemSettings? systemSettings;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, systemSettings: $systemSettings}';
  }
}

/// generated route for
/// [ScanDetails]
class ScanDetailsRoute extends PageRouteInfo<ScanDetailsRouteArgs> {
  ScanDetailsRoute({
    Key? key,
    required ScannedInfo scannedInfo,
    required void Function(String) onDelete,
  }) : super(
          ScanDetailsRoute.name,
          path: 'scanDetails',
          args: ScanDetailsRouteArgs(
            key: key,
            scannedInfo: scannedInfo,
            onDelete: onDelete,
          ),
        );

  static const String name = 'ScanDetailsRoute';
}

class ScanDetailsRouteArgs {
  const ScanDetailsRouteArgs({
    this.key,
    required this.scannedInfo,
    required this.onDelete,
  });

  final Key? key;

  final ScannedInfo scannedInfo;

  final void Function(String) onDelete;

  @override
  String toString() {
    return 'ScanDetailsRouteArgs{key: $key, scannedInfo: $scannedInfo, onDelete: $onDelete}';
  }
}

/// generated route for
/// [LanguageScreen]
class LanguageScreenRoute extends PageRouteInfo<LanguageScreenRouteArgs> {
  LanguageScreenRoute({
    Key? key,
    required void Function(Language) onChangeLanguage,
  }) : super(
          LanguageScreenRoute.name,
          path: 'language',
          args: LanguageScreenRouteArgs(
            key: key,
            onChangeLanguage: onChangeLanguage,
          ),
        );

  static const String name = 'LanguageScreenRoute';
}

class LanguageScreenRouteArgs {
  const LanguageScreenRouteArgs({
    this.key,
    required this.onChangeLanguage,
  });

  final Key? key;

  final void Function(Language) onChangeLanguage;

  @override
  String toString() {
    return 'LanguageScreenRouteArgs{key: $key, onChangeLanguage: $onChangeLanguage}';
  }
}
