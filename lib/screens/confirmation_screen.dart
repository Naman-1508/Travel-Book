import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define custom colors
    const Color primaryColor = Colors.blue;
    final Color lightBackgroundColor = Colors.blue[50]!;
    final Color darkTextColor = Colors.blue[900]!;
    final Color mediumTextColor = Colors.blue[700]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
        color: lightBackgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Confirmation Icon
                const Icon(
                  Icons.check_circle_outline,
                  color: primaryColor,
                  size: 80,
                ),
                const SizedBox(height: 20),
                // Main Confirmation Message
                Text(
                  'Booking Confirmed!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: darkTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                // Additional Details
                Text(
                  'Thank you for booking with us. Your reservation details have been sent to your email.',
                  style: TextStyle(
                    fontSize: 16,
                    color: mediumTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Button to return to the home screen
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Return to Home',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
