import 'package:country_api_application/core/themes/theme_provider.dart';
import 'package:country_api_application/features/presentation/pages/country_detailes.dart';
import 'package:country_api_application/features/presentation/pages/county_page.dart';
import 'package:country_api_application/features/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemesProvider>(context).themeData,
      title: 'Country API application',
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/country_page': (context) => const CountyPage(),
        '/country_detailes': (context) => const CountryDetailes(),
      },
    );
  }
}
