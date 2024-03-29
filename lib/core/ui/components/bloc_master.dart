import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../error/errors.dart';
import '../../models/notification.dart';
import '../../services/bloc.dart';
import 'dialogs/dialog_displayer.dart';
import 'loader.dart';

class GSBlocConsumer<B extends Cubit<S>, S> extends StatelessWidget {
  final B? bloc;
  final BlocWidgetBuilder<S> builder;
  final BlocWidgetListener<S>? listener;
  final BlocBuilderCondition<S>? buildWhen;
  final BlocListenerCondition<S>? listenWhen;
  final bool useScreenLoader;
  final bool useDialogDisplayer;

  const GSBlocConsumer({
    this.bloc,
    required this.builder,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    this.useScreenLoader = true,
    this.useDialogDisplayer = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = BlocConsumer<B, S>(
      bloc: bloc,
      builder: (context, output) {
        return BlockingLoader(
          isLoading:
              output is GSBlocOutput && useScreenLoader && output.isLoading,
          child: builder(context, output),
        );
      },
      buildWhen: buildWhen,
      listener: (context, output) {
        if (output is GSBlocOutput) {
          if (useDialogDisplayer) {
            final error = output.error;
            if (error is GSAlertError) {
              context.dialogDisplayer.showAlert(
                type: GSNotificationType.error,
                body: error.userMessage,
              );
            }
          }
        }
        listener?.call(context, output);
      },
      listenWhen: listenWhen,
    );
    return child;
  }
}

class BlocMaster<B extends Cubit<S>, S> extends StatelessWidget {
  final B Function(BuildContext context) create;
  final BlocWidgetBuilder<S> builder;
  final BlocWidgetListener<S>? listener;
  final BlocBuilderCondition<S>? buildWhen;
  final BlocListenerCondition<S>? listenWhen;
  final bool useScreenLoader;
  final bool useDialogDisplayer;

  const BlocMaster({
    required this.create,
    required this.builder,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    this.useScreenLoader = true,
    this.useDialogDisplayer = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: create,
      child: GSBlocConsumer<B, S>(
        builder: builder,
        listener: listener,
        buildWhen: buildWhen,
        listenWhen: listenWhen,
        useScreenLoader: useScreenLoader,
        useDialogDisplayer: useDialogDisplayer,
      ),
    );
  }
}
