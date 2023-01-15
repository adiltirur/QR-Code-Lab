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
        child: const HomeScreen(),
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
