import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/router/app_routes.dart';
import 'form/app_elevated_button.dart';
import 'indication_widget/indication_widget.dart';

/// [HomeEmptyView] is the empty view of the home screen.
class HomeEmptyView extends StatelessWidget {
  /// [HomeEmptyView] constructor.
  const HomeEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IndicationWidget(
            splashIcon: Assets.clock,
            title: context.localization.homeEmptyTitle,
            description: context.localization.homeEmptyDescription,
          ),
        ),
        AppElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoutes.createTimer);
          },
          child: context.localization.getStarted,
        ),
      ],
    );
  }
}
