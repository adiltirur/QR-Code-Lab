import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../const/colors.dart';
import '../../../models/notification.dart';

import '../animations/animated_appearance.dart';
import 'dialog.dart';

class DialogDisplayer extends StatefulWidget {
  final Widget child;

  const DialogDisplayer({
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => DialogDisplayerState();

  static DialogDisplayerState of(BuildContext context) {
    return context.findRootAncestorStateOfType<DialogDisplayerState>()!;
  }
}

class DialogDisplayerState extends State<DialogDisplayer> {
  static const _animationDuration = Duration(milliseconds: 200);

  final List<WBDialog> _dialogs = [];

  void showDialog(WBDialog dialog) {
    _dialogs.clear();
    setState(() {
      _dialogs.add(dialog);
    });
  }

  Future<void> showAlert({
    required WBNotificationType type,
    required String body,
    String? linkText,
    void Function()? onTapLink,
  }) async {
    final completer = Completer<void>();
    final dialog = WBDialog(
      type: type,
      content: WBAlertDialogContent(
        body: body,
        onClose: () {
          setState(() {
            _dialogs.removeAt(0);
          });
          completer.complete();
        },
      ),
    );
    setState(() {
      _dialogs.add(dialog);
    });
    return completer.future;
  }

  Widget _buildDialog() {
    final visible = _dialogs.isNotEmpty;
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedAppearance(
          visible: visible,
          duration: _animationDuration,
          childBuilder: (_) => Container(
            color: WBColors.black.withOpacity(0.5),
          ),
        ),
        AnimatedAppearance.slide(
          visible: visible,
          duration: _animationDuration,
          childBuilder: (_) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Builder(builder: _dialogs.first.build),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        _buildDialog(),
      ],
    );
  }
}

extension DialogDisplayerBuildContext on BuildContext {
  DialogDisplayerState get dialogDisplayer => DialogDisplayer.of(this);
}

Future<T?> showActionDialog<T>({
  required BuildContext context,
  required String title,
  required List<WBDialogAction<T>> actions,
  required bool isDismissible,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    isDismissible: isDismissible,
    backgroundColor: WBColors.transparent,
    builder: (context) => WBActionDialogContent<T>(
      title: title,
      actions: actions,
      onTapAction: (value) => context.router.pop(value),
      isDismissible: isDismissible,
    ),
  );
}

Future<bool> showTextYesNoDialog(
  BuildContext context,
  String text, {
  String? yesText,
  String? noText,
}) async {
  return await showActionDialog<bool>(
        context: context,
        title: text,
        actions: [
          WBDialogAction(
            text: yesText ?? tr('general.yes'),
            value: true,
          ),
          WBDialogAction(
            text: noText ?? tr('general.no'),
            value: false,
          ),
        ],
        isDismissible: true,
      ) ==
      true;
}
