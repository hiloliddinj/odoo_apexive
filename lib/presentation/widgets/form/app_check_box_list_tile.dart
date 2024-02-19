// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';

/// [AppCheckBoxListTile] is a widget that displays a checkbox list tile.
class AppCheckBoxListTile extends StatelessWidget {
  /// [AppCheckBoxListTile] constructor.
  const AppCheckBoxListTile({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  /// The text to display.
  final String text;

  /// The value of the checkbox.
  final bool value;

  /// The function to call when the value of the checkbox changes.
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
