import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

/// [AppTextFormField] is a custom text form field widget.
class AppTextFormField extends StatelessWidget {
  /// [AppTextFormField] constructor.
  const AppTextFormField({
    super.key,
    this.controller,
    this.onChanged,
  });

  /// [controller] is the text editing controller.
  final TextEditingController? controller;

  /// [onChanged] is the function of the onChanged.
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: context.localization.description,
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return context.localization.emptyDescription;
          }

          return null;
        },
      ),
    );
  }
}
