import 'package:bus_booking_application/view/bill_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _destination;
  int? _totalPassenger;
  DateTime? date;
  final List<Map> _destinations = [
    {'name': 'Chitwan', 'price': 900},
    {'name': 'Pokhara', 'price': 1200},
    {'name': 'Butwal', 'price': 1900},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayush_Bus Booking"),
      ),
      body: Stack(children: [
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
            heightFactor: 0.5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flexible(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButtonFormField<String>(
                        value: _destination,
                        items: _destinations
                            .map((destination) => DropdownMenuItem<String>(
                                  value: destination['name'],
                                  child: Text(destination['name']),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _destination = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Select Destination',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null
                            ? 'Please select a destination'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Number of Passengers',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _totalPassenger = int.tryParse(value);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the number of passengers';
                          }
                          final int? num = int.tryParse(value);
                          if (num == null || num <= 0 || num > 30) {
                            return 'Invalid passenger count)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Travel Date',
                          border: OutlineInputBorder(),
                        ),
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate:
                                DateTime.now().add(const Duration(days: 1)),
                            firstDate:
                                DateTime.now().add(const Duration(days: 1)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 7)),
                          );
                          setState(() {
                            date = picked;
                          });
                        },
                        validator: (value) {
                          if (date == null) {
                            return 'Please select a travel date';
                          }
                          return null;
                        },
                        controller: TextEditingController(
                          text: date != null
                              ? ' ${date?.day}/${date?.month}/${date?.year}'
                              : '',
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final selectedDestination =
                                _destinations.firstWhere((destination) =>
                                    destination['name'] == _destination);
                            final farePerPassenger =
                                selectedDestination['price'];
                            final totalFare =
                                farePerPassenger * _totalPassenger!;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillScreen(
                                  destination: _destination!,
                                  travelDate: date!,
                                  numberOfPassengers: _totalPassenger!,
                                  farePerPassenger: farePerPassenger,
                                  totalFare: totalFare,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
