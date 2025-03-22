import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/features/home/modal_view/locale_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// locale provider
    final provider = Provider.of<LocaleProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Text with Localization
                Text(
                  AppLocalizations.of(context)!.helloWorld,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 30),

                /// DropDown Button for Language Selection
                DropdownButtonFormField<Locale>(
                  decoration: InputDecoration(
                    labelText: "Select Language",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: provider.locale, // Selected language
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text("English"),
                    ),
                    DropdownMenuItem(value: Locale('hi'), child: Text("Hindi")),
                    DropdownMenuItem(
                      value: Locale('fr'),
                      child: Text("French"),
                    ),
                    DropdownMenuItem(
                      value: Locale('ar'),
                      child: Text("Arabic"),
                    ),
                  ],
                  onChanged: (Locale? newLocale) {
                    if (newLocale != null) {
                      provider.setLocale(newLocale);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
