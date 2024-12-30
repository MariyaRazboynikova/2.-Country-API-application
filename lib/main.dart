import 'package:country_api_application/export.dart';

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
        '/country_page': (context) => CountryPage(),
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
