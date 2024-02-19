import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

/// [AppElevatedButton] is a widget that displays an elevated button.
class AppElevatedButton extends StatelessWidget {
  /// [AppElevatedButton] constructor.
  const AppElevatedButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  /// The child widget to display.
  final String child;

  /// The function to call when the button is pressed.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          child,
          style: TextStyle(
            color: context.theme.colorScheme.onPrimary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
