import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'core/const/borders.dart';
import 'core/const/colors.dart';
import 'core/const/fonts.dart';
import 'core/extensions/list.dart';
import 'core/extensions/material_state.dart';
import 'core/globals/platform.dart';
import 'core/models/language.dart';
import 'core/routes/router.dart';
import 'core/services/cryptor.dart';
import 'core/services/error_logger.dart';
import 'core/services/system_info.dart';
import 'core/ui/components/dialogs/dialog_displayer.dart';
import 'flavors.dart';

const _textStyle = TextStyle(
  fontFamily: WBFonts.titilliumWeb,
  color: WBColors.black,
  height: 1.521,
  letterSpacing: 0.12,
);

Future<SystemInfo> _createSystemInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final String deviceModel;
  final String deviceOSName;
  final String deviceOSVersion;
  final String deviceId;
  final bool isRealDevice;
  final deviceInfo = DeviceInfoPlugin();
  switch (platform) {
    case GSPlatform.android:
      final androidInfo = await deviceInfo.androidInfo;
      deviceModel = androidInfo.model;
      deviceOSName = 'android';
      deviceOSVersion = androidInfo.version.release;
      deviceId = androidInfo.id;
      isRealDevice = androidInfo.isPhysicalDevice;
      break;
    case GSPlatform.ios:
      final iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.utsname.machine ?? '';
      deviceOSName = iosInfo.systemName ?? '';
      deviceOSVersion = iosInfo.systemVersion ?? '';
      deviceId = iosInfo.identifierForVendor ?? '';
      isRealDevice = iosInfo.isPhysicalDevice;
      break;
  }
  return SystemInfo(
    packageInfo.version,
    packageInfo.buildNumber,
    deviceModel,
    deviceOSName,
    deviceOSVersion,
    deviceId,
    isRealDevice,
  );
}

class HabitsApp extends StatelessWidget {
  static final _appRouter = AppRouter();

  const HabitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Habits',
      theme: ThemeData(
        backgroundColor: GSColors.white,
        scaffoldBackgroundColor: GSColors.white,
        fontFamily: GSFonts.inter,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          labelStyle: _textStyle.copyWith(
            backgroundColor: GSColors.white,
          ),
          fillColor: GSColors.white,
          enabledBorder: GSInputBorders.main,
          disabledBorder: GSInputBorders.main,
          focusedBorder: GSInputBorders.focused,
          focusedErrorBorder: GSInputBorders.error,
          errorBorder: GSInputBorders.error,
          prefixIconColor: GSColors.black,
          suffixIconColor: GSColors.black,
          hintStyle: _textStyle.copyWith(
            fontSize: 16,
            color: GSColors.grey,
          ),
          floatingLabelStyle: GSMaterialStateTextStyle.resolveFocused(
            (focused) => TextStyle(
              color: focused ? GSColors.primary : GSColors.black,
            ),
          ),
          errorStyle: _textStyle.copyWith(color: GSColors.red),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: _textStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: _textStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          labelColor: GSColors.black,
          unselectedLabelColor: GSColors.grey,
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(GSColors.transparent),
        ),
        textTheme: TextTheme(
          bodyText1: _textStyle,
          bodyText2: _textStyle,
          button: _textStyle,
          subtitle1: _textStyle.copyWith(fontSize: 16),
        ),
        radioTheme: RadioThemeData(
          fillColor:
              MaterialStateColor.resolveWith((states) => GSColors.primary),
        ),
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, child) => Material(
        child: DialogDisplayer(child: child!),
      ),
    );
  }
}

Future<void> _appEntry() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemInfo.shared = await _createSystemInfo();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Cryptor.shared.init();
  await Firebase.initializeApp(
    name: 'habits',
    options: F.firebaseOption,
  );
  runApp(
    EasyLocalization(
      supportedLocales: Language.values.mapToList(
        (e) => e.locale,
      ),
      fallbackLocale: Language.english.locale,
      path: 'assets/l10n',
      child: const HabitsApp(),
    ),
  );
}

void appEntry() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (error) =>
          ErrorLogger.shared.log(error, error.stack ?? StackTrace.current);
      _appEntry();
    },
    ErrorLogger.shared.log,
  );
}
