import 'package:flutter/material.dart';

class QRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              // Handle order cancellation logic here
              Navigator.pop(context); // Pop the QRPage from the navigation stack
            },
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Handle order transferred logic here
              // For example, you can show a confirmation dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Order Transferred'),
                  content: const Text('Your order has been successfully transferred.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.pop(context); // Pop the QRPage from the navigation stack
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/qrcode.png'), // Adjust the path accordingly
            SizedBox(height: 20),
            // Add additional widgets here if needed
          ],
        ),
      ),
    );
  }
}
