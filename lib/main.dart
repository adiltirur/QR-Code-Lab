import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/const/colors.dart';
import 'core/const/fonts.dart';
import 'core/extensions/list.dart';
import 'core/models/language.dart';
import 'core/routes/router.dart';
import 'core/services/error_logger.dart';
import 'core/ui/components/dialogs/dialog_displayer.dart';
import 'repository/scanner/models/hive_scanned_item.dart';
import 'repository/system/models/hive_system_info.dart';

const _textStyle = TextStyle(
  fontFamily: WBFonts.titilliumWeb,
  color: WBColors.black,
  height: 1.521,
  letterSpacing: 0.12,
);

class WorkerBaseScannerApp extends StatelessWidget {
  static final _appRouter = AppRouter();

  const WorkerBaseScannerApp({super.key});

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
      theme: ThemeData(
        backgroundColor: WBColors.white,
        scaffoldBackgroundColor: WBColors.white,
        fontFamily: WBFonts.titilliumWeb,
        textTheme: TextTheme(
          bodyText1: _textStyle,
          bodyText2: _textStyle,
          button: _textStyle,
          subtitle1: _textStyle.copyWith(fontSize: 16),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) => WBColors.primary,
          ),
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
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter<HiveScannedItem>(HiveScannedItemAdapter())
    ..registerAdapter<HiveSystemInfo>(HiveSystemInfoAdapter());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      supportedLocales: Language.values.mapToList(
        (e) => e.locale,
      ),
      fallbackLocale: Language.english.locale,
      path: 'assets/l10n',
      child: const WorkerBaseScannerApp(),
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
