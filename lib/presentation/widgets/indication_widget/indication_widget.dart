import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';
import 'subs/app_description.dart';
import 'subs/app_title.dart';
import 'subs/big_icon_square.dart';

/// [IndicationWidget] is a widget that shows a big icon, a texts.
class IndicationWidget extends StatelessWidget {
  /// [IndicationWidget] constructor.
  const IndicationWidget({
    super.key,
    required this.splashIcon,
    required this.title,
    required this.description,
  });

  /// The image to display.
  final AssetGenImage splashIcon;

  /// The title to display.
  final String title;

  /// The description to display.
  final String description;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: IndicationWidget,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BigIconSquare(image: splashIcon),
          const SizedBox(height: 30),
          AppTitle(text: title),
          const SizedBox(height: 10),
          AppDescription(text: description),
        ],
      ),
    );
  }
}
