import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension GSBuildContext on BuildContext {
  B bloc<B extends StateStreamableSource<Object?>>() =>
      BlocProvider.of<B>(this);

  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  bool get isAccessible => MediaQuery.of(this).accessibleNavigation;
}
