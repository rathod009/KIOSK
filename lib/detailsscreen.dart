import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:kiosk/widgets/grid_item.dart';

class DetailScreen extends StatelessWidget {
  final GridItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ // Explicitly typing <Widget> is good practice
            Text(
              item.description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            QrImageView( // Use QrImageView
              data: item.qrData,
              version: QrVersions.auto,
              size: 200.0, // Size is now a named parameter
            ),
          ],
        ),
      ),
    );
  }
}