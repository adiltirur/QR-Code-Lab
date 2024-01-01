import 'package:flutter/material.dart';

import '../../extensions/list.dart';

class RadioListItem<T> {
  final T value;
  final String text;

  const RadioListItem({required this.value, required this.text});
}

class RadioList<T> extends StatelessWidget {
  final String? title;
  final List<RadioListItem<T>> items;
  final T value;
  final void Function(T value) onChanged;

  const RadioList({
    this.title,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildItem(RadioListItem item) {
    return RadioListTile.adaptive(
      title: Text(item.text),
      useCupertinoCheckmarkStyle: true,
      value: item.value,
      groupValue: value,
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) _buildTitle(title),
        ...items.mapToList(_buildItem),
      ],
    );
  }
}
