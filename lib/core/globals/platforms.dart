import 'dart:io';

import 'package:flutter/foundation.dart';

enum GSPlatform { android, ios, web }

final platform = kIsWeb
    ? GSPlatform.web
    : Platform.isAndroid
        ? GSPlatform.android
        : GSPlatform.ios;
