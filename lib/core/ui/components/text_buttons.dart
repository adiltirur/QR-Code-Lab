import 'package:flutter/material.dart';

import '../../const/borders.dart';
import '../../const/colors.dart';
import '../../extensions/material_state.dart';

enum GSTextButtonStyle { filled }

class _GSTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool enabled;
  final Color color;
  final bool outlined;

  const _GSTextButton({
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
            borderRadius: const BorderRadius.all(GSRadius.circular),
            side:
                outlined ? BorderSide(color: color, width: 2) : BorderSide.none,
          )),
          backgroundColor: GSMaterialStateProperty.resolveEnabled(
            (enabled) => (outlined ? GSColors.white : color)
                .withOpacity(enabled ? 1 : 0.4),
          ),
          foregroundColor: GSMaterialStateProperty.resolveEnabled(
            (enabled) => (outlined ? color : GSColors.white)
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

class GSTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final GSTextButtonStyle style;
  final bool enabled;
  final Color color;

  const GSTextButton({
    required this.text,
    required this.onPressed,
    this.style = GSTextButtonStyle.filled,
    this.enabled = true,
    this.color = GSColors.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case GSTextButtonStyle.filled:
        return _GSTextButton(
          text: text,
          onPressed: onPressed,
          enabled: enabled,
          color: color,
          outlined: false,
        );
    }
  }
}
