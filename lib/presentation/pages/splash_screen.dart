import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/router/app_routes.dart';
import '../base/base_view.dart';
import '../widgets/indication_widget/indication_widget.dart';

/// [SplashScreen] is the first screen of the application.
class SplashScreen extends StatefulWidget {
  /// [SplashScreen] constructor.
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    EasyLoading.instance
      ..dismissOnTap = false
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.transparent
      ..userInteractions = false;

    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      isScrollabe: false,
      useSafeArea: false,
      child: IndicationWidget(
        splashIcon: Assets.time,
        title: context.localization.odoo,
        description: context.localization.splashDescription,
      ),
    );
  }
}
