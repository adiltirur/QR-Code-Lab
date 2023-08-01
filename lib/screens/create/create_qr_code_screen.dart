import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/extensions/list.dart';
import '../../core/models/scanned_info.dart';
import '../../core/routes/router.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bloc_master.dart';
import '../../core/ui/components/text_buttons.dart';
import 'create_qr_code_bloc.dart';
import 'create_qr_code_state.dart';
import 'form/text_form.dart';

typedef _BlocOutput = GSBlocOutput<CreateQRCodeState, CreateQRCodeEvent>;

extension on QRCodeItem {
  Widget buildItemForm(BuildContext context, QRCodeItem selectedType) {
    switch (this) {
      default:
        return TextForm(
          type: selectedType,
          onChanged: (text) {
            context.bloc<CreateQRCodeBloc>().updateQRText(text);
          },
        );
    }
  }
}

class CreateQRCode extends StatelessWidget {
  Widget _buildCreateButton(
    String? text,
    CreateQRCodeBloc bloc,
    QRCodeItem type,
  ) {
    return GSTextButton(
      enabled: text != null,
      text: 'create.button'.tr(),
      onPressed: () async {
        if (text != null) bloc.onCreate(type, text);
      },
      color: GSColors.primary,
    );
  }

  ChoiceChip _buildQRCodeItem(
    BuildContext context,
    QRCodeItem item,
    QRCodeItem selectedItem,
  ) {
    return ChoiceChip(
      label: Text(item.name),
      selected: selectedItem == item,
      onSelected: (selected) {
        if (selected) context.bloc<CreateQRCodeBloc>().updateQRType(item);
      },
    );
  }

  Widget _buildChoiceChip(BuildContext context, QRCodeItem type) {
    return Wrap(
      spacing: 16.0,
      children: QRCodeItem.values.mapToList(
        (item) => _buildQRCodeItem(context, item, type),
      ),
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
  ) {
    final state = output.state;
    final bloc = context.bloc<CreateQRCodeBloc>();
    final type = state.type;
    final text = state.text;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildChoiceChip(context, type),
          const SizedBox(height: 16),
          type.buildItemForm(context, type),
          const SizedBox(height: 16),
          _buildCreateButton(text, bloc, type),
        ],
      ),
    );
  }

  Future<void> _handleCreated(
    BuildContext context,
    ScannedInfo scannedInfo,
  ) async {
    final bloc = context.bloc<CreateQRCodeBloc>();
    FocusScope.of(context).unfocus();
    context.router.push(
      ScanDetailsRoute(
        scannedInfo: scannedInfo,
        onDelete: bloc.onDeleteItem,
        onBack: context.router.pop,
      ),
    );
  }

  void _blocListener(
    BuildContext context,
    _BlocOutput output,
  ) {
    for (final event in output.events) {
      event.when<void>(
        created: (scannedInfo) => _handleCreated(
          context,
          scannedInfo,
        ),
        onBack: () {
          context.router.pop();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('bottom_navigation.create'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: GSColors.white,
          ),
        ),
      ),
      body: BlocMaster<CreateQRCodeBloc, _BlocOutput>(
        create: (_) => CreateQRCodeBloc(),
        builder: _blocBuilder,
        listener: _blocListener,
        useScreenLoader: true,
      ),
    );
  }
}
