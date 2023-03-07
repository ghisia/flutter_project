import 'package:eticketpurchase/screens/bus-list/index.dart';
import 'package:eticketpurchase/screens/read-qr-screen/index.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back on ETicket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BusListScreen(),
                          ),
                        );
              },
              icon: const Icon(Icons.airline_seat_recline_extra),
              label: const Text('Make Seat Reservation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
             Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QRCodeScannerScreen(),
                          ),
                        );
              },
              icon: const Icon(Icons.directions_bus),
              label: const Text('Enter Bus'),
            ),
          ],
        ),
      ),
    );
  }
}
