import 'dart:io';

enum GSPlatform { android, ios }

final platform = Platform.isAndroid ? GSPlatform.android : GSPlatform.ios;
