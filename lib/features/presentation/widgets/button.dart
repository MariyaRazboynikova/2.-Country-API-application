import 'package:flutter/material.dart';

class ButtonFotInitialPage extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ButtonFotInitialPage({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 300, decoration: BoxDecoration()),
    );
  }
}
