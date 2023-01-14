import 'package:flutter/material.dart';
import 'app.dart';
import 'core/const/flavors.dart';

void main() {
  F.appFlavor = Flavor.prod;
  runApp(App());
}
