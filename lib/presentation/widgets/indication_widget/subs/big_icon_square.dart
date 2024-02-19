import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/gen/assets.gen.dart';

/// [BigIconSquare] is a big square with an icon in the middle.
class BigIconSquare extends StatelessWidget {
  /// [BigIconSquare] constructor.
  const BigIconSquare({
    super.key,
    required this.image,
  });

  /// The image to display.
  final AssetGenImage image;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: image.image(
        width: 192,
        height: 192,
      ),
    );
  }
}
