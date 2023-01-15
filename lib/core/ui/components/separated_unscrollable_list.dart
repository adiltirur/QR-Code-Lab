import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../extensions/list.dart';

class WBListButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData? leadingIcon;
  final bool showTrailingIcon;

  const WBListButton({
    required this.title,
    required this.onTap,
    this.leadingIcon,
    this.showTrailingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
      tileColor: WBColors.white,
      leading:
          leadingIcon != null ? Icon(leadingIcon, color: WBColors.black) : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: showTrailingIcon
          ? const Icon(Icons.chevron_right, color: WBColors.black)
          : null,
      onTap: onTap,
    );
  }
}

class WBListSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool)? onChanged;
  final bool enabled;

  const WBListSwitch({
    required this.title,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
      tileColor: WBColors.white,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      //TODO black to primary
      activeColor: WBColors.black,
      value: value,
      onChanged: enabled ? onChanged : null,
    );
  }
}

class GSListExpansion extends StatelessWidget {
  final String title;
  final Widget child;

  const GSListExpansion({
    required this.title,
    required this.child,
  });

  GSListExpansion.text({
    required this.title,
    required String text,
  }) : child = Text(
          text,
          style: const TextStyle(fontSize: 16, color: WBColors.grey),
        );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: WBColors.transparent,
        unselectedWidgetColor: WBColors.black,
      ),
      child: ExpansionTile(
        iconColor: WBColors.black,
        textColor: WBColors.black,
        title: Text(title),
        childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        tilePadding: const EdgeInsets.symmetric(horizontal: 24),
        expandedAlignment: Alignment.centerLeft,
        children: [child],
      ),
    );
  }
}

class SeparatedUnScrollableList extends ListView {
  static Widget _buildChild(
      Widget child, bool isNotLast, bool showLastSeparator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        child,
        if (isNotLast || showLastSeparator)
          Container(height: 1, color: WBColors.grey),
      ],
    );
  }

  SeparatedUnScrollableList({
    required List<Widget> children,
    bool showLastSeparator = true,
  }) : super(
          children: children.mapIndexed(
            (index, child) => _buildChild(
              child,
              index < children.length - 1,
              showLastSeparator,
            ),
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
        );

  SeparatedUnScrollableList.builder({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    bool showLastSeparator = true,
  }) : super.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) => _buildChild(
            itemBuilder(context, index),
            index < itemCount - 1,
            showLastSeparator,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
        );

  SeparatedUnScrollableList.buttons({
    required List<String> texts,
    void Function(int)? onTap,
    bool showLastSeparator = true,
  }) : this(
          children: texts.mapIndexed(
            (i, text) => WBListButton(
              title: text,
              onTap: onTap == null ? null : () => onTap(i),
            ),
          ),
          showLastSeparator: showLastSeparator,
        );
}
