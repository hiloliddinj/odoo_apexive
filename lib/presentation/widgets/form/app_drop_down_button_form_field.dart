// ignore_for_file: no_magic_number
import 'package:flutter/material.dart';
import 'package:odoo_apexive/core/extensions/context_extension.dart';

/// [AppDropDownButtonFormField] is the drop down button form field
/// of the application.
class AppDropDownButtonFormField<T> extends StatelessWidget {
  /// [AppDropDownButtonFormField] constructor.
  const AppDropDownButtonFormField({
    super.key,
    required this.items,
    required this.hintText,
    this.onChanged,
  });

  /// The items of the drop down button form field.
  final List<T> items;

  /// The hint of the drop down button form field.
  final String hintText;

  /// The function of the onChanged.
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: DropdownButtonFormField<T>(
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()),
              ),
            )
            .toList(),
        onChanged: onChanged,
        style: context.theme.dropdownMenuTheme.textStyle,
        selectedItemBuilder: (context) {
          return items.map((item) {
            return Text(
              item.toString(),
              style: context.theme.textTheme.bodyLarge,
            );
          }).toList();
        },
        icon: Icon(
          Icons.arrow_drop_down,
          color: context.theme.colorScheme.onPrimary,
        ),
        hint: Text(
          hintText,
          style: context.theme.textTheme.bodyLarge,
        ),
        validator: (value) {
          if (value == null) {
            return context.localization.pleaseSelectAnItem;
          }

          return null;
        },
      ),
    );
  }
}
