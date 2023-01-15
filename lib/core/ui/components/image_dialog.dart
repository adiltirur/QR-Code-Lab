import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final Uint8List image;

  const ImageDialog({required this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: RotatedBox(
        quarterTurns: 1,
        child: Image.memory(
          image,
        ),
      ),
    );
  }
}
