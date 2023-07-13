import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../extensions/list.dart';

class GSListButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData? leadingIcon;
  final bool showTrailingIcon;

  const GSListButton({
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
      tileColor: GSColors.white,
      leading:
          leadingIcon != null ? Icon(leadingIcon, color: GSColors.black) : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: showTrailingIcon
          ? const Icon(Icons.chevron_right, color: GSColors.black)
          : null,
      onTap: onTap,
    );
  }
}

class GSListSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool)? onChanged;
  final bool enabled;

  const GSListSwitch({
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
      tileColor: GSColors.white,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      activeColor: GSColors.primary,
      value: value,
      onChanged: enabled ? onChanged : null,
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
          Container(height: 1, color: GSColors.grey),
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
            (i, text) => GSListButton(
              title: text,
              onTap: onTap == null ? null : () => onTap(i),
            ),
          ),
          showLastSeparator: showLastSeparator,
        );
}
