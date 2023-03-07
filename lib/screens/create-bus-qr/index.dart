import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BusQRCodeScreen extends StatelessWidget {
  final String busId;

  const BusQRCodeScreen({Key? key, required this.busId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: busId,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20),
            const Text(
              'Scan this QR code to board the bus',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}