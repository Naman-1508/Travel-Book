import 'package:flutter/material.dart';

class BookingOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BookingOptionButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Text color
        minimumSize: const Size(100, 50), // Size of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        elevation: 4, // Shadow effect
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      child: Text(text),
    );
  }
}
