import 'package:flutter/material.dart';

import '../../core/colors/app_colors.dart';
import '../../core/extensions/context_extension.dart';

/// BaseView is the base view for all views in the app.
class BaseView extends StatelessWidget {
  /// BaseView
  const BaseView({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.isScreenPaddingEnabled = true,
    this.isScrollabe = true,
    this.useSafeArea = true,
  });

  /// child
  final Widget child;

  /// appBar
  final PreferredSizeWidget? appBar;

  /// bottomNavigationBar
  final Widget? bottomNavigationBar;

  /// drawer
  final Drawer? drawer;

  /// FloatingActionButton for the view if any is needed.
  final FloatingActionButton? floatingActionButton;

  /// isScreenPaddingEnabled is a flag to enable/disable screen padding.
  final bool isScreenPaddingEnabled;

  /// isScrollabe is a flag to enable/disable scroll.
  final bool isScrollabe;

  /// useSafeArea is a flag to enable/disable safe area.
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget localChild = child;
    if (isScreenPaddingEnabled) {
      localChild = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: localChild,
      );
    }
    if (isScrollabe) {
      localChild = SingleChildScrollView(
        child: localChild,
      );
    }
    if (useSafeArea) {
      localChild = SafeArea(
        child: localChild,
      );
    }

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.appColorLight,
              AppColors.appColorDark,
            ],
          ),
        ),
        child: localChild,
      ),
    );
  }
}
