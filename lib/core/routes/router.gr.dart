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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    ScanDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ScanDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ScanDetails(
          scannedInfo: args.scannedInfo,
          onDelete: args.onDelete,
          onBack: args.onBack,
        ),
      );
    },
    LanguageScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageScreenRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LanguageScreen(onChangeLanguage: args.onChangeLanguage),
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
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: 'home',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [ScanDetails]
class ScanDetailsRoute extends PageRouteInfo<ScanDetailsRouteArgs> {
  ScanDetailsRoute({
    required ScannedInfo scannedInfo,
    required void Function(String) onDelete,
    required void Function() onBack,
  }) : super(
          ScanDetailsRoute.name,
          path: 'scanDetails',
          args: ScanDetailsRouteArgs(
            scannedInfo: scannedInfo,
            onDelete: onDelete,
            onBack: onBack,
          ),
        );

  static const String name = 'ScanDetailsRoute';
}

class ScanDetailsRouteArgs {
  const ScanDetailsRouteArgs({
    required this.scannedInfo,
    required this.onDelete,
    required this.onBack,
  });

  final ScannedInfo scannedInfo;

  final void Function(String) onDelete;

  final void Function() onBack;

  @override
  String toString() {
    return 'ScanDetailsRouteArgs{scannedInfo: $scannedInfo, onDelete: $onDelete, onBack: $onBack}';
  }
}

/// generated route for
/// [LanguageScreen]
class LanguageScreenRoute extends PageRouteInfo<LanguageScreenRouteArgs> {
  LanguageScreenRoute({required void Function(Language) onChangeLanguage})
      : super(
          LanguageScreenRoute.name,
          path: 'language',
          args: LanguageScreenRouteArgs(onChangeLanguage: onChangeLanguage),
        );

  static const String name = 'LanguageScreenRoute';
}

class LanguageScreenRouteArgs {
  const LanguageScreenRouteArgs({required this.onChangeLanguage});

  final void Function(Language) onChangeLanguage;

  @override
  String toString() {
    return 'LanguageScreenRouteArgs{onChangeLanguage: $onChangeLanguage}';
  }
}
