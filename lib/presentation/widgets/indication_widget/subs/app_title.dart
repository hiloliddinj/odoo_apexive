import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

/// [AppTitle] is a widget that displays the application title.
class AppTitle extends StatelessWidget {
  /// [AppTitle] constructor.
  const AppTitle({super.key, required this.text});

  /// The text to display.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.theme.textTheme.titleLarge?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
