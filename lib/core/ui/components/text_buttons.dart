import 'package:flutter/material.dart';

import '../../const/borders.dart';
import '../../const/colors.dart';
import '../../extensions/material_state.dart';

enum WBTextButtonStyle { filled }

class _WBTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool enabled;
  final Color color;
  final bool outlined;

  const _WBTextButton({
    required this.text,
    required this.onPressed,
    this.enabled = true,
    required this.color,
    required this.outlined,
  }) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(WBRadius.circular),
            side:
                outlined ? BorderSide(color: color, width: 2) : BorderSide.none,
          )),
          backgroundColor: WBMaterialStateProperty.resolveEnabled(
            (enabled) => (outlined ? WBColors.white : color)
                .withOpacity(enabled ? 1 : 0.4),
          ),
          foregroundColor: WBMaterialStateProperty.resolveEnabled(
            (enabled) => (outlined ? color : WBColors.white)
                .withOpacity(enabled ? 1 : 0.4),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class WBTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final WBTextButtonStyle style;
  final bool enabled;
  final Color color;

  const WBTextButton({
    required this.text,
    required this.onPressed,
    this.style = WBTextButtonStyle.filled,
    this.enabled = true,
    this.color = WBColors.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case WBTextButtonStyle.filled:
        return _WBTextButton(
          text: text,
          onPressed: onPressed,
          enabled: enabled,
          color: color,
          outlined: false,
        );
    }
  }
}
