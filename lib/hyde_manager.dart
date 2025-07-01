import 'package:flutter/material.dart' show MaterialApp, ThemeData;
import 'package:flutter/widgets.dart';
import 'core/config/constants/app_constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class HyDEManager extends StatelessWidget {
  // ignore: avoid_unused_constructor_parameters
  HyDEManager(final AppRouter appRouter, {super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(final BuildContext context) => MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      navigatorKey: AppRouter.navigatorKey,
      initialRoute: Routes.mainPage,
      onGenerateRoute: appRouter.generateRoute,
      themeAnimationCurve: Curves.easeInOutCirc,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      supportedLocales: const [
        // English (United States)
        Locale('en', 'US'),
        // Spanish (Mexico)
        Locale('es', 'MX'),
        // German (Germany)
        Locale('de', 'DE'),
        // Dutch (Netherlands)
        Locale('nl', 'NL'),
        // Chinese (China)
        Locale('zh', 'CN'),
        // Chinese (Hong Kong)
        Locale('zh', 'HK'),
        // Chinese (Taiwan)
        Locale('zh', 'TW'),
        // French (France)
        Locale('fr', 'FR'),
        // Portuguese (Brazil)
        Locale('pt', 'BR'),
        // Japanese (Japan)
        Locale('ja', 'JP'),
        // Korean (South Korea)
        Locale('ko', 'KR'),
      ],
    );
}
