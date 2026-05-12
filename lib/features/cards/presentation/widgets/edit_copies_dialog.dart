import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../state/card_detail_provider.dart';

void showEditCopiesDialog(BuildContext context, int current) {
  final controller = TextEditingController(text: current.toString());

  final provider = context.read<CardDetailProvider>();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit card amount"),
        content: TextField(
          controller: controller,
          autofocus: true,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final value = int.tryParse(controller.text) ?? 0;

              await provider.updateCopies(value);

              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}