import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/const/colors.dart';
import 'core/const/fonts.dart';
import 'core/env/env.dart';
import 'core/extensions/build_context.dart';
import 'core/extensions/list.dart';
import 'core/globals/platforms.dart';
import 'core/models/language.dart';
import 'core/models/system_info.dart';
import 'core/routes/router.dart';
import 'core/services/error_logger.dart';
import 'core/ui/components/bloc_master.dart';
import 'core/ui/components/dialogs/dialog_displayer.dart';
import 'repository/scanner/models/hive_scanned_item.dart';
import 'repository/system/models/hive_system_info.dart';
import 'screens/home/home_bloc.dart';
import 'screens/home/home_screen.dart';

Future<SystemInfo> _createSystemInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final String deviceModel;
  final String deviceOSName;
  final String deviceOSVersion;
  final bool isRealDevice;
  final deviceInfo = DeviceInfoPlugin();
  switch (platform) {
    case GSPlatform.android:
      final androidInfo = await deviceInfo.androidInfo;
      deviceModel = androidInfo.model;
      deviceOSName = 'android';
      deviceOSVersion = androidInfo.version.release;
      isRealDevice = androidInfo.isPhysicalDevice;
      break;
    case GSPlatform.ios:
      final iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.utsname.machine;
      deviceOSName = iosInfo.systemName;
      deviceOSVersion = iosInfo.systemVersion;
      isRealDevice = iosInfo.isPhysicalDevice;
      break;
    case GSPlatform.web:
      deviceModel = 'iosInfo.utsname.machine';
      deviceOSName = '';
      deviceOSVersion = '';
      isRealDevice = true;
      break;
  }
  return SystemInfo(
    appVersion: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
    packageName: packageInfo.packageName,
    deviceModel: deviceModel,
    deviceOSName: deviceOSName,
    deviceOSVersion: deviceOSVersion,
    isRealDevice: isRealDevice,
  );
}

class GradSprintScannerApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'QR-Scanner',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, child) => BlocMaster<HomeBloc, HomeBlocOutput>(
        create: (_) => HomeBloc(
          isDarkMode: context.isDarkMode,
        ),
        builder: (context, state) => MaterialApp(
          themeMode: state.state.systemSettings.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: GSColors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: GSColors.primary,
              iconTheme: IconThemeData(color: GSColors.white),
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
              color: GSColors.white,
            ),
            fontFamily: GSFonts.titilliumWeb,
            radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith(
                (states) => GSColors.primary,
              ),
            ),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: GSColors.black,
                  displayColor: GSColors.black,
                ),
            listTileTheme: const ListTileThemeData(
              iconColor: GSColors.black,
            ),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                iconColor: MaterialStateColor.resolveWith(
                  (states) => GSColors.black,
                ),
              ),
            ),
            dialogTheme: const DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: GSColors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: GSColors.black,
              iconTheme: IconThemeData(color: GSColors.white),
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
              color: GSColors.black,
            ),
            fontFamily: GSFonts.titilliumWeb,
            radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith(
                (states) => GSColors.white,
              ),
            ),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: GSColors.white,
                  displayColor: GSColors.white,
                ),
            listTileTheme: ListTileThemeData(
              iconColor: GSColors.white,
              subtitleTextStyle: TextStyle(
                color: GSColors.white.withOpacity(0.5),
              ),
            ),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                iconColor: MaterialStateColor.resolveWith(
                  (states) => GSColors.white,
                ),
              ),
            ),
            chipTheme: const ChipThemeData(
              labelStyle: TextStyle(
                color: GSColors.black,
              ),
              secondaryLabelStyle: TextStyle(
                color: GSColors.black,
              ),
            ),
            dialogTheme: const DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          ),
          home: DialogDisplayer(child: child!),
        ),
      ),
    );
  }
}

Future<void> _appEntry() async {
  await EasyLocalization.ensureInitialized();
  SystemInfo.shared = await _createSystemInfo();
  await Hive.initFlutter();
  Hive
    ..registerAdapter<HiveScannedItem>(HiveScannedItemAdapter())
    ..registerAdapter<HiveSystemInfo>(HiveSystemInfoAdapter());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = Env.sentryDSN
        ..attachScreenshot = true
        ..tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      EasyLocalization(
        supportedLocales: Language.values.mapToList(
          (e) => e.locale,
        ),
        fallbackLocale: Language.english.locale,
        path: 'assets/l10n',
        child: SentryScreenshotWidget(
          child: GradSprintScannerApp(),
        ),
      ),
    ),
  );
}

void appEntry() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
/*       await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError; */
      FlutterError.onError = (error) =>
          ErrorLogger.shared.log(error, error.stack ?? StackTrace.current);
      _appEntry();
    },
    ErrorLogger.shared.log,
  );
}
