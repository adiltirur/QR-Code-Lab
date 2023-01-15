import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../const/colors.dart';
import 'animations/animated_appearance.dart';

const _defaultColor = WBColors.primary;

class LottieLoader extends StatelessWidget {
  final Color color;
  final double size;
  final double strokeWidth;

  const LottieLoader({
    this.color = _defaultColor,
    this.size = 00,
    this.strokeWidth = 4,
  }) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/animations/loader.json');
  }
}

class BlockingLoader extends StatelessWidget {
  final bool isLoading;
  final String message;
  final Widget child;

  const BlockingLoader({
    required this.isLoading,
    this.message = '',
    required this.child,
  });

  Widget _buildLoadingBlocker() {
    return AnimatedAppearance(
      visible: isLoading,
      duration: const Duration(milliseconds: 120),
      childBuilder: (_) => Container(
        color: WBColors.black.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LottieLoader(color: WBColors.white),
              if (message.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: WBColors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        _buildLoadingBlocker(),
      ],
    );
  }
}
