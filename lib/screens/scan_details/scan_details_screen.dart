import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ScanDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.router.pop(true),
        ),
      ),
      body: const Center(
        child: Text('ScanDetails Page'),
      ),
    );
  }
}
