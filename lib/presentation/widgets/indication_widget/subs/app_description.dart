import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

/// [AppDescription] is a widget that displays the application description.
class AppDescription extends StatelessWidget {
  /// [AppDescription] constructor.
  const AppDescription({super.key, required this.text});

  /// The text to display.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.theme.textTheme.bodyLarge,
    );
  }
}
