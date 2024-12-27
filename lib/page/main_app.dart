import 'package:my_balance/page/home/home_page.dart';
import 'package:my_balance/services/navigation/navigation_service.dart';
import 'package:my_balance/services/provider/provider_setup.dart';
import 'package:my_balance/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'my_balance',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        navigatorKey: NavigationService.navigationKey,
        home: const HomePage(),
        routes: Routes.routes,
      ),
    );
  }
}
