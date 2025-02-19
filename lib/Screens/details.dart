import 'package:flutter/material.dart';
import 'package:kiosk/utils/text_file.dart'; // Assuming this contains getInfoText
import 'package:kiosk/Widgets/info_text.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:kiosk/Widgets/grid_item.dart';

class DetailScreen extends StatelessWidget {
  final GridItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg0.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column( // Main Column for vertical arrangement
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container( // Container for QR Code and Description (Row)
                padding: const EdgeInsets.all(16), // Add padding here
                // decoration: BoxDecoration(
                //   color: Colors.white.withAlpha(100), // Semi-transparent background
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          item.description,
                          style: const TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        QrImageView(
                          data: item.qrData,
                          version: QrVersions.auto,
                          size: 240.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Space between QR and text
              Expanded( // Expand the text widget to fill available space
                child: Container( // Container for InfoTextWidget
                  padding: const EdgeInsets.all(16),
                  // decoration: BoxDecoration(
                  //   color: Colors.white.withAlpha(180), // Semi-transparent background
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  child: InfoTextWidget(
                    infoText: getInfoText(item.title),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
