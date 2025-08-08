import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {
  final String destination;
  final DateTime travelDate;
  final int numberOfPassengers;
  final int farePerPassenger;
  final int totalFare;

  const BillScreen({
    super.key,
    required this.destination,
    required this.travelDate,
    required this.numberOfPassengers,
    required this.farePerPassenger,
    required this.totalFare,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayush_Billing'),
      ),
      body: Stack(children: [
        // Background Image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bus.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: FractionallySizedBox(
            alignment: Alignment.center,
            heightFactor: 0.5, // Takes 50% of the screen height
            child: Container(
              width: double.infinity, // Takes up full width of the screen
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.7), // To make it semi-transparent
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flexible(
                // padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Destination: $destination'),
                    Text(
                        'Travel Date: ${travelDate.year}-${travelDate.month.toString().padLeft(2, '0')}-${travelDate.day.toString().padLeft(2, '0')}'),
                    Text('Number of Passengers: $numberOfPassengers'),
                    Text('Fare Per Passenger: Rs $farePerPassenger'),
                    Text('Total Fare: Rs $totalFare'),
                    const SizedBox.square(),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Booking Confirmed!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
