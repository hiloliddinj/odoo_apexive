// ignore_for_file: avoid_non_null_assertion

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/odoo_apexive_localizations.dart';

/// Extension on [BuildContext] to get the size of the screen.
extension ContextExtension on BuildContext {
  /// Returns the width of the screen.
  double get width => MediaQuery.sizeOf(this).width;

  /// Returns the height of the screen.
  double get height => MediaQuery.sizeOf(this).height;

  /// Theme
  ThemeData get theme => Theme.of(this);

  /// Localization
  OdooApexiveLocalizations get localization =>
      OdooApexiveLocalizations.of(this)!;
}
