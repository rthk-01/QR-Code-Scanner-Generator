import 'package:flutter/material.dart';
import 'scan_qr_code.dart';  // Import your ScanQrCode class
import 'generate_qr_code.dart';  // Import your GenerateQrCode class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner and Generator',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner and Generator'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScanQrCode()),
                );
              },
              child: Text('Scan QR Code'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GenerateQrCode()),
                );
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
