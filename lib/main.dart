import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/features/home/modal_view/locale_provider.dart';
import 'package:localization/features/home/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// locale provider
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      builder: (context, child) {
        final localeProvider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App Local',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            // tamil
            Locale("ta"),
            // english
            Locale("en"),
            // hindi
            Locale("hi"),
            // arabic
            Locale("ar"),
            // french
            Locale("fr"),
          ],
          locale: localeProvider.locale,

          home: HomeScreen(),
        );
      },
    );
  }
}
