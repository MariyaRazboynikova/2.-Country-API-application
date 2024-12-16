import 'package:country_api_application/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'REST Countries BLoC App',
            style: GoogleFonts.kaiseiTokumin(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          Lottie.asset('lib/core/assets/countries.json'),
          const SizedBox(height: 40),
          ButtonForInitialPage(
            text: 'Start',
            onTap: () => Navigator.pushNamed(context, '/home_pages'),
          ),
        ],
      ),
    );
  }
}
