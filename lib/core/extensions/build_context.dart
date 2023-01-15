import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension WBBuildContext on BuildContext {
  B bloc<B extends StateStreamableSource<Object?>>() =>
      BlocProvider.of<B>(this);
}
