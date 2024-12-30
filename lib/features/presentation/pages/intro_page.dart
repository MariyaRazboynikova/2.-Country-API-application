import 'package:country_api_application/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        spacing: 40,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(
            child: Text(
              'REST Countries BLoC App',
              style: GoogleFonts.kaiseiTokumin(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          Icon(
            Icons.travel_explore,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),

          ButtonForInitialPage(
            text: 'Start',
            onTap: () => Navigator.pushNamed(context, '/home_pages'),
          ),
        ],
      ),
    );
  }
}
