import 'package:flutter/material.dart';

import '../../../const/borders.dart';
import '../../../const/colors.dart';
import '../../../extensions/list.dart';
import '../../../models/notification.dart';
import '../separated_unscrollable_list.dart';

class WBAlertDialogContent extends StatelessWidget {
  static const _textStyle = TextStyle(fontSize: 16);

  final String body;

  const WBAlertDialogContent({
    required this.body,
  });

  Widget _buildBody() {
    return Text(body, style: _textStyle);
  }

  Widget _buildCloseButton() {
    return const CloseButton();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBody(),
        _buildCloseButton(),
      ],
    );
  }
}

class WBDialog extends StatelessWidget {
  final WBNotificationType type;
  final Widget content;

  const WBDialog({
    required this.type,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: const BorderRadius.all(WBRadius.circular),
      ),
      padding: const EdgeInsets.fromLTRB(18, 20, 0, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(type.icon),
          const SizedBox(width: 14),
          Expanded(child: content),
        ],
      ),
    );
  }
}

class WBDialogAction<T> {
  final String text;
  final IconData? iconData;
  final T value;

  const WBDialogAction({
    required this.text,
    this.iconData,
    required this.value,
  });
}

class WBActionDialogContent<T> extends StatelessWidget {
  static const _textStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

  final String title;
  final List<WBDialogAction<T>> actions;
  final void Function(T value) onTapAction;
  final bool isDismissible;

  const WBActionDialogContent({
    required this.title,
    required this.actions,
    required this.onTapAction,
    required this.isDismissible,
  });

  Widget _buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 13, isDismissible ? 24 : 12, 13),
            child: Text(title, style: _textStyle),
          ),
        ),
        if (isDismissible) ...[
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: CloseButton(),
          ),
          const SizedBox(width: 12),
        ],
      ],
    );
  }

  Widget _buildActions() {
    return SeparatedUnScrollableList(
      children: actions.mapToList(
        (e) => WBListButton(
          title: e.text,
          onTap: () => onTapAction(e.value),
          leadingIcon: e.iconData,
          showTrailingIcon: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: WBColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(),
            _buildActions(),
          ],
        ),
      ),
    );
  }
}
