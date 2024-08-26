import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';  // Import for PlatformException

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = 'Scanned Result will appear here';

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (!mounted) return;
      setState(() {
        qrResult = qrCode.toString();
      });
    } on PlatformException {
      setState(() {
        qrResult = 'Failed to get the QR Code';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              qrResult,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: scanQR,
              child: Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
