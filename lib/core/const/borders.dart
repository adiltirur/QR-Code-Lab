import 'package:flutter/material.dart';

import 'colors.dart';

class GSRadius {
  static const circular = Radius.circular(8.0);
}

class GSInputBorders {
  static const mainBlack = OutlineInputBorder(
    borderSide: BorderSide(color: GSColors.black, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const mainGray = OutlineInputBorder(
    borderSide: BorderSide(color: GSColors.grey, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const focused = OutlineInputBorder(
    borderSide: BorderSide(color: GSColors.primary, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const error = OutlineInputBorder(
    borderSide: BorderSide(color: GSColors.red, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const none = OutlineInputBorder(
    borderSide: BorderSide(width: 0),
  );
}
