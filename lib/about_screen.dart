import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to our application! Here, you can find the latest updates and information about our services. We are dedicated to providing the best user experience and continually improving our app to meet your needs.'
                  '\nThis application in one key solution for you to book your tickets at your convenience and at cheaper rates.You can book cab,bus tickets,flight tickets,train tickets and even metro tickets from Travel Book'
                  '\nThis app is developed by:'
                  '\nNaman Jain USN:1MS23CY042'
                  '\nSankalp Gupta USN:1MS23EE053',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
