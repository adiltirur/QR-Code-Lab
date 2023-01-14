import 'package:flutter/material.dart';

class AnimatedAppearance extends StatelessWidget {
  static Widget _slideTransitionBuilder(
    Widget child,
    Animation<double> animation,
    Offset entryOffset,
  ) {
    return SlideTransition(
      position: Tween<Offset>(begin: entryOffset, end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }

  final bool visible;
  final Duration duration;
  final WidgetBuilder childBuilder;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  const AnimatedAppearance({
    required this.visible,
    required this.duration,
    required this.childBuilder,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  });

  AnimatedAppearance.slide({
    required this.visible,
    required this.duration,
    required this.childBuilder,
    Offset entryOffset = const Offset(0, -0.1),
  }) : transitionBuilder = ((child, animation) =>
            _slideTransitionBuilder(child, animation, entryOffset));

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: transitionBuilder,
      child: visible ? Builder(builder: childBuilder) : null,
    );
  }
}
