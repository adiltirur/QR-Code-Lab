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

class GradSprintScannerApp extends StatelessWidget {
  static final _appRouter = AppRouter();

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
        useMaterial3: true,
        scaffoldBackgroundColor: GSColors.white,
        fontFamily: GSFonts.titilliumWeb,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) => GSColors.primary,
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
      child: GradSprintScannerApp(),
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
