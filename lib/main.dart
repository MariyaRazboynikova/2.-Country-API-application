import 'package:country_api_application/core/themes/theme_provider.dart';
import 'package:country_api_application/features/presentation/pages/city_detail_page.dart%20.dart';
import 'package:country_api_application/features/presentation/pages/home_pages.dart';
import 'package:country_api_application/features/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemesProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      title: 'REST Countries BLoC App',
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/home_pages': (context) => HomePage(),
        '/city_detail_page.dart':
            (context) => const CityDetailPage(
              cityName: '',
              stateName: '',
              countryName: '',
            ),
      },
    );
  }
}
