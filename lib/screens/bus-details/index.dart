import 'package:eticketpurchase/screens/create-bus-qr/index.dart';
import 'package:flutter/material.dart';

class Bus {
  String name;
  List<String> seats;

  Bus({required this.name, required this.seats});
}

class BusDetailScreen extends StatelessWidget {
  final String bus;
  final List<String> seats;

  BusDetailScreen({required this.bus, required this.seats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bus),
      ),
      body: ListView.builder(
        itemCount: seats.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              // BusQRCodeScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BusQRCodeScreen(
                    busId: "${bus}Seat_${index + 1}",
                  ),
                ),
              );
            },
            title: Text("Seat ${index + 1}"),
            // subtitle: Text(seats[index]),
          );
        },
      ),
    );
  }
}
