import 'package:flutter/material.dart';

class ButtonForInitialPage extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ButtonForInitialPage({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            const SizedBox(width: 10),

            //icon
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).colorScheme.surface,
            ),
          ],
        ),
      ),
    );
  }
}
