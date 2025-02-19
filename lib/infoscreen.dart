import 'package:flutter/material.dart';
import 'detailsscreen.dart'; // Import the DetailScreen
import 'widgets/grid_item.dart'; // Import the GridItem class (see below)

class InfoScreen extends StatelessWidget {
  final List<GridItem> gridItems = [
    GridItem('Inquiry', 'For general inquiries', 'https://www.example.com/inquiry'),
    GridItem('Feedback', 'Share your feedback', 'https://www.example.com/feedback'),
    GridItem('Request', 'Submit a request', 'https://www.example.com/request'),
    GridItem('Alumni', 'Alumni information', 'https://www.example.com/alumni'),
    GridItem('Form 5', 'Form 5 Details', 'https://www.example.com/form5'),
    GridItem('Form 6', 'Form 6 Details', 'https://www.example.com/form6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Information Technology Centre - Kiosk')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Center(
                child: Text(
                  item.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}