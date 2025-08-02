import 'package:flutter/material.dart';
import 'confirmation_screen.dart';

class TrainBookingScreen extends StatefulWidget {
  const TrainBookingScreen({super.key});

  @override
  _TrainBookingScreenState createState() => _TrainBookingScreenState();
}

class _TrainBookingScreenState extends State<TrainBookingScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _fromStation = '';
  String _toStation = '';
  String? _selectedPaymentMethod;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Booking'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // From Station Field
            _buildTextField('From Station', Icons.train, (value) {
              setState(() {
                _fromStation = value;
              });
            }),
            const SizedBox(height: 16),

            // To Station Field
            _buildTextField('To Station', Icons.train, (value) {
              setState(() {
                _toStation = value;
              });
            }),
            const SizedBox(height: 16),

            // Date Picker
            _buildDateTimePicker(
              label: 'Select Date',
              icon: Icons.calendar_today,
              onTap: _selectDate,
              value: _selectedDate != null ? _selectedDate!.toLocal().toString().split(' ')[0] : 'Select Date',
            ),
            const SizedBox(height: 16),

            // Time Picker
            _buildDateTimePicker(
              label: 'Select Time',
              icon: Icons.access_time,
              onTap: _selectTime,
              value: _selectedTime != null ? _selectedTime!.format(context) : 'Select Time',
            ),
            const SizedBox(height: 20),

            // Payment Method Dropdown
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedPaymentMethod,
              hint: const Text('Select Payment Method'),
              items: const [
                DropdownMenuItem(value: 'UPI', child: Text('UPI')),
                DropdownMenuItem(value: 'Paytm', child: Text('Paytm')),
                DropdownMenuItem(value: 'PhonePe', child: Text('PhonePe')),
                DropdownMenuItem(value: 'GPay', child: Text('GPay')),
                DropdownMenuItem(value: 'Credit Card', child: Text('Credit Card')),
                DropdownMenuItem(value: 'Debit Card', child: Text('Debit Card')),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.payment, color: Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 20),

            // Confirm Booking Button
            ElevatedButton(
              onPressed: () {
                if (_selectedDate != null && _selectedTime != null && _selectedPaymentMethod != null) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ConfirmationScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please complete all fields')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, ValueChanged<String> onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildDateTimePicker({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required String value,
  }) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.blueAccent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: const TextStyle(fontSize: 16)),
          Icon(icon, color: Colors.blueAccent),
        ],
      ),
    );
  }
}
