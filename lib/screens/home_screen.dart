import 'package:flutter/material.dart';
import 'bus_booking_screen.dart';
import 'cab_booking_screen.dart';
import 'login_screen.dart';
import 'metro_booking_screen.dart';
import 'train_booking_screen.dart';
import 'flight_booking_screen.dart';
import '../widgets/booking_option_button.dart';
import '../widgets/menu_drawer.dart';  // Import MenuDrawer

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Book'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      drawer: const MenuDrawer(),  // Use MenuDrawer here
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: HomePageContent(),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center align children
      children: [


        // User Greeting
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Welcome Back, Naman',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),



        // Travel Tips
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Travel Tips', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(height: 10),
                const Text('1. Always carry a power bank for your devices.\n2. Keep important documents in a safe place.\n3. Check travel advisories before your trip.'),
                // Add more travel tips here
              ],
            ),
          ),
        ),

        // Booking Options
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: BookingOptions(),
        ),
      ],
    );
  }
}

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center align children
      children: [
        Text(
          'Book Your Travel',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          alignment: WrapAlignment.center,
          children: [
            BookingOptionButton(
              icon: Icons.directions_bus,
              text: 'Bus',
              gradientColors: const [Colors.orangeAccent, Colors.deepOrange],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const BusBookingScreen()));
              },
            ),
            BookingOptionButton(
              icon: Icons.local_taxi,
              text: 'Cab',
              gradientColors: const [Colors.yellowAccent, Colors.amber],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CabBookingScreen()));
              },
            ),
            BookingOptionButton(
              icon: Icons.subway,
              text: 'Metro',
              gradientColors: const [Colors.tealAccent, Colors.teal],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MetroBookingScreen()));
              },
            ),
            BookingOptionButton(
              icon: Icons.train,
              text: 'Train',
              gradientColors: const [Colors.indigoAccent, Colors.indigo],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TrainBookingScreen()));
              },
            ),
            BookingOptionButton(
              icon: Icons.airplanemode_active,
              text: 'Flight',
              gradientColors: const [Colors.purpleAccent, Colors.deepPurple],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FlightBookingScreen()));
              },
            ),
          ],
        ),
      ],
    );
  }
}

class BookingOptionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<Color> gradientColors;
  final VoidCallback onPressed;

  const BookingOptionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.gradientColors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50.0, color: Colors.white),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
