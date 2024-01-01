// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    LanguageScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LanguageScreen(onChangeLanguage: args.onChangeLanguage),
      );
    },
    ScanDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ScanDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScanDetails(
          scannedInfo: args.scannedInfo,
          onDelete: args.onDelete,
          onBack: args.onBack,
        ),
      );
    },
    SplashScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SplashScreenRouteArgs>(
          orElse: () => const SplashScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(
          key: args.key,
          showAnimation: args.showAnimation,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LanguageScreen]
class LanguageScreenRoute extends PageRouteInfo<LanguageScreenRouteArgs> {
  LanguageScreenRoute({
    required void Function(Language) onChangeLanguage,
    List<PageRouteInfo>? children,
  }) : super(
          LanguageScreenRoute.name,
          args: LanguageScreenRouteArgs(onChangeLanguage: onChangeLanguage),
          initialChildren: children,
        );

  static const String name = 'LanguageScreenRoute';

  static const PageInfo<LanguageScreenRouteArgs> page =
      PageInfo<LanguageScreenRouteArgs>(name);
}

class LanguageScreenRouteArgs {
  const LanguageScreenRouteArgs({required this.onChangeLanguage});

  final void Function(Language) onChangeLanguage;

  @override
  String toString() {
    return 'LanguageScreenRouteArgs{onChangeLanguage: $onChangeLanguage}';
  }
}

/// generated route for
/// [ScanDetails]
class ScanDetailsRoute extends PageRouteInfo<ScanDetailsRouteArgs> {
  ScanDetailsRoute({
    required ScannedInfo scannedInfo,
    required void Function(String) onDelete,
    required void Function() onBack,
    List<PageRouteInfo>? children,
  }) : super(
          ScanDetailsRoute.name,
          args: ScanDetailsRouteArgs(
            scannedInfo: scannedInfo,
            onDelete: onDelete,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'ScanDetailsRoute';

  static const PageInfo<ScanDetailsRouteArgs> page =
      PageInfo<ScanDetailsRouteArgs>(name);
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
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<SplashScreenRouteArgs> {
  SplashScreenRoute({
    Key? key,
    bool showAnimation = true,
    List<PageRouteInfo>? children,
  }) : super(
          SplashScreenRoute.name,
          args: SplashScreenRouteArgs(
            key: key,
            showAnimation: showAnimation,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const PageInfo<SplashScreenRouteArgs> page =
      PageInfo<SplashScreenRouteArgs>(name);
}

class SplashScreenRouteArgs {
  const SplashScreenRouteArgs({
    this.key,
    this.showAnimation = true,
  });

  final Key? key;

  final bool showAnimation;

  @override
  String toString() {
    return 'SplashScreenRouteArgs{key: $key, showAnimation: $showAnimation}';
  }
}
