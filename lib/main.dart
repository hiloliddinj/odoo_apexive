import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/odoo_apexive_localizations.dart';

import 'core/database/hive_helper.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'presentation/service/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  await initServiceLocator();
  runApp(const Main());
}

/// [Main] is the root widget of the application.
class Main extends StatefulWidget {
  /// [Main] constructor.
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: OdooApexiveLocalizations.localizationsDelegates,
      supportedLocales: OdooApexiveLocalizations.supportedLocales,
      locale: OdooApexiveLocalizations.supportedLocales.first,
      builder: EasyLoading.init(),
      theme: lightTheme,
      routerConfig: router,
    );
  }

  @override
  void dispose() {
    HiveHelper.closeBoxes();
    super.dispose();
  }
}
