import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/extensions/date_time.dart';
import '../../core/models/scanned_info.dart';
import '../../core/routes/router.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';
import '../../repository/scanner/models/hive_scanned_item.dart';
import 'empty_list_screen.dart';
import 'scan_history_bloc.dart';
import 'scan_history_state.dart';

typedef _BlocOutput = WBBlocOutput<ScanHistoryState, ScanHistoryEvent>;

class ScanHistoryScreen extends StatelessWidget {
  Widget _circularImage(Uint8List? image) {
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

  Widget _buildListTile(
    Uint8List? image,
    HiveScannedItem scannedItem,
    String? displayValue,
    DateTime createdDate,
    BuildContext context,
  ) {
    return ListTile(
      leading: _circularImage(image),
      title: Text(
        scannedItem.customName.isNotEmpty
            ? scannedItem.customName
            : displayValue ?? '',
      ),
      subtitle: Text(createdDate.formattedDate),
      onTap: () {
        context.bloc<ScanHistoryBloc>().onTapScannedItem(scannedItem);
      },
    );
  }

  List<Widget> _buildSortButton(
    List<HiveScannedItem> scannedItems,
    BuildContext context,
  ) {
    return [
      if (scannedItems.isNotEmpty && scannedItems.length > 1)
        IconButton(
          onPressed: () =>
              context.bloc<ScanHistoryBloc>().onToggleReverseList(),
          icon: const Icon(
            Icons.sort,
            color: WBColors.white,
          ),
        )
    ];
  }

  Text _buildTitle() {
    return const Text(
      'scan_history.title',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: WBColors.white,
      ),
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
  ) {
    final scannedItems = output.state.scannedItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WBColors.primary,
        centerTitle: false,
        title: _buildTitle().tr(),
        actions: _buildSortButton(scannedItems, context),
      ),
      body: scannedItems.isEmpty
          ? EmptyListScreen()
          : ListView.builder(
              itemCount: scannedItems.length,
              reverse: output.state.reverseList,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final scannedItem = scannedItems[index];
                final createdDate = scannedItem.createdAt;
                final displayValue = scannedItem.displayValue;
                final image = scannedItem.qrCode;
                return _buildListTile(
                  image,
                  scannedItem,
                  displayValue,
                  createdDate,
                  context,
                );
              },
            ),
    );
  }

  void _handleQRCodeDetected(
    BuildContext context,
    ScannedInfo scannedInfo,
  ) {
    final bloc = context.bloc<ScanHistoryBloc>();
    context.router.push(
      ScanDetailsRoute(
        scannedInfo: scannedInfo,
        onDelete: bloc.onDeleteItem,
        onBack: bloc.onBackFromDetailsPage,
      ),
    );
  }

  void _blocListener(
    BuildContext context,
    _BlocOutput output,
  ) {
    for (final event in output.events) {
      event.when<void>(
        open: (scannedInfo) => _handleQRCodeDetected(
          context,
          scannedInfo,
        ),
        onBack: () => context.router.pop(),
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
