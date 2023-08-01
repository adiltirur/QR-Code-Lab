import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/const/borders.dart';
import '../create_qr_code_state.dart';

extension on QRCodeItem {
  TextInputType get keyboardType {
    switch (this) {
      case QRCodeItem.email:
        return TextInputType.emailAddress;
      case QRCodeItem.text:
        return TextInputType.multiline;
      case QRCodeItem.url:
        return TextInputType.url;
      case QRCodeItem.phone:
        return TextInputType.phone;
    }
  }

  String get label {
    switch (this) {
      case QRCodeItem.email:
        return tr('create.email_hint');
      case QRCodeItem.text:
        return tr('create.text_hint');
      case QRCodeItem.url:
        return tr('create.url_hint');
      case QRCodeItem.phone:
        return tr('create.phone_hint');
    }
  }
}

class TextForm extends HookWidget {
  final void Function(String)? onChanged;
  final QRCodeItem type;

  const TextForm({
    required this.onChanged,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final textController = useTextEditingController();
    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      keyboardType: type.keyboardType,
      decoration: InputDecoration(
        label: Text(type.label),
        alignLabelWithHint: true,
        enabledBorder: GSInputBorders.mainGray,
      ),
      minLines: 3,
      maxLines: 6,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
    );
  }
}
