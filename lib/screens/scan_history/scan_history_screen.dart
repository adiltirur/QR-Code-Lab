import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/const/flavors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/routes/router.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';
import 'scan_history_bloc.dart';
import 'scan_history_state.dart';

typedef _BlocOutput = WBBlocOutput<ScanHistoryState, ScanHistoryEvent>;

class ScanHistoryScreen extends StatelessWidget {
  Widget circularImage(Uint8List? image) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey.withOpacity(0.2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: image != null
            ? RotatedBox(
                quarterTurns: 1,
                child: Image.memory(
                  image,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.qr_code),
      ),
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
  ) {
    var scannedItems = output.state.scannedItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WBColors.white,
        centerTitle: false,
        title: const Text(
          'Scan History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: WBColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                context.bloc<ScanHistoryBloc>().onToggleReverseList(),
            icon: const Icon(
              Icons.sort,
              color: WBColors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: scannedItems.length,
        reverse: output.state.reverseList,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var scannedItem = scannedItems[index];
          final createdDate = scannedItem.createdAt;
          final displayValue = scannedItem.displayValue;
          final image = scannedItem.qrCode;

          var uuid = scannedItem.uuid;
          return ListTile(
            leading: circularImage(image),
            title: Text(displayValue ?? ''),
            subtitle: Text(createdDate.toIso8601String()),
            onTap: () =>
                context.bloc<ScanHistoryBloc>().onTapScannedItem(scannedItem),
          );
        },
      ),
    );
  }

  void _blocListener(
    BuildContext context,
    _BlocOutput output,
  ) {
    for (final event in output.events) {
      event.when<void>(
        open: (scannedInfo) => context.router.push(
          ScanDetailsRoute(
            scannedInfo: scannedInfo,
            onDelete: context.bloc<ScanHistoryBloc>().onDeleteItem,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocMaster<ScanHistoryBloc, _BlocOutput>(
      create: (_) => ScanHistoryBloc(),
      builder: _blocBuilder,
      listener: _blocListener,
      useScreenLoader: true,
    );
  }
}
