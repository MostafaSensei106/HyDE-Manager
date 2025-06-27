import 'package:flutter/material.dart';
import 'package:hydemanager/core/config/constants/app_constants.dart';

class HyDEManager extends StatelessWidget {
  const HyDEManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // navigatorKey:,
      // initialRoute:,
      // onGenerateRoute:,
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
}
