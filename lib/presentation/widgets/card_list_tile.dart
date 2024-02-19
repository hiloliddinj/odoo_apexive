import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';

/// [CardListTile] is the list tile of the card.
class CardListTile extends StatelessWidget {
  /// [CardListTile] constructor.
  const CardListTile({
    required this.text,
    required this.iconData,
    this.isTitle = false,
  });

  /// [iconData] is the icon data.
  final IconData iconData;

  /// [text] is the text.
  final String text;

  /// [isTitle] is the title.
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text,
          style: isTitle
              ? context.theme.textTheme.titleMedium
              : context.theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
