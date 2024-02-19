import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';

/// [AppBarItem] is a widget that displays an item in the app bar.
class AppBarItem extends StatelessWidget {
  /// [AppBarItem] constructor.
  const AppBarItem({
    super.key,
    required this.iconData,
    this.onPressed,
  });

  /// IconData for the item.
  final IconData iconData;

  /// Function to call when the item is pressed.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
