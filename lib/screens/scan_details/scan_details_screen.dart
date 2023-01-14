import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/models/scanned_info.dart';

class ScanDetails extends StatelessWidget {
  final ScannedInfo scannedInfo;

  const ScanDetails({super.key, required this.scannedInfo});
  @override
  Widget build(BuildContext context) {
    var qrCode = scannedInfo.qrCode;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.router.pop(true),
        ),
      ),
      body: Column(
        children: [
          if (qrCode != null) ...[Image.memory(qrCode)],
          Center(
            child: Text(scannedInfo.barCode.rawValue ?? ''),
          ),
        ],
      ),
    );
  }
}
