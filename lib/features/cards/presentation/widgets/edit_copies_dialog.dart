import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../state/card_detail_provider.dart';

void showEditCopiesDialog(BuildContext context, int current) {
  final controller = TextEditingController(text: current.toString());

  final provider = context.read<CardDetailProvider>();

  int value = current;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void update(int newValue) {
            value = newValue;
            controller.text = value.toString();
          }

          return AlertDialog(
            title: const Text("Edit card amount"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: value > 0
                          ? () => setState(() => update(value - 1))
                          : null,
                      icon: const Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 60,
                      child: TextField(
                        controller: controller,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (text) {
                          final parsed = int.tryParse(text);
                          if (parsed != null) {
                            value = parsed;
                          }
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() => update(value + 1)),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await provider.updateCopies(value);
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          );
        },
      );
    },
  );
}