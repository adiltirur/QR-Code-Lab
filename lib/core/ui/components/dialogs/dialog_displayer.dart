import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../models/notification.dart';
import '../animations/animated_appearance.dart';
import '../text_buttons.dart';
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
    setState(() {
      _dialogs.add(dialog);
    });
  }

  Future<void> showAlert({
    required WBNotificationType type,
    required String body,
  }) async {
    final completer = Completer<void>();
    final dialog = WBDialog(
      type: type,
      content: WBAlertDialogContent(
        body: body,
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
            text: yesText ?? 'Yes',
            value: true,
          ),
          //TODO Add yes and no to intl
          WBDialogAction(
            text: noText ?? 'No',
            value: false,
          ),
        ],
        isDismissible: true,
      ) ==
      true;
}

Future<void> showSingleActionBottomSheet({
  required BuildContext context,
  required String title,
  required String message,
  String? buttonText,
  Function()? buttonAction,
}) async {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )),
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
            decoration: const BoxDecoration(
              color: WBColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 13, 24, 13),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  WBTextButton(
                    text: buttonText ?? tr('general.close'),
                    onPressed: () {
                      if (buttonAction != null) {
                        buttonAction();
                      } else {
                        Navigator.maybePop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ));
}
