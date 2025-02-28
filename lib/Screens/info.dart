import 'package:flutter/material.dart';
import 'package:kiosk/utils/gradient_utils.dart';
import 'details.dart';
import '../Widgets/grid_item.dart';

class InfoScreen extends StatelessWidget {
  final List<GridItem> gridItems = [
    GridItem('Inquiry Form', 'For general inquiries', 'https://qr.page/g/3L78eiKy0ut', Icons.question_answer),
    GridItem('Feedback Form', 'Share your feedback', 'https://qr.page/g/2AlYpvwB2HY', Icons.feedback),
    GridItem('Request Form', 'Submit a request', 'https://qr.page/g/46Hcyx75D9n', Icons.assignment),
    GridItem('Alumni Form', 'Alumni information', 'https://www.itcentre.org/alumni/index.php?p=registration', Icons.school),
    GridItem('Placement Form', 'Placement assistance', 'https://www.example.com/form5', Icons.work),
    GridItem('Certificate Request', 'Submit a request', 'https://www.example.com/form6', Icons.card_membership),
    GridItem('Entrance Quiz', 'Attempt Quiz', 'https://www.example.com/form6', Icons.quiz),
  ];

  InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Information Technology Centre - Kiosk')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg0.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: Colors.black, width: 1.5),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: getGradient(index),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.icon,
                          size: 60,
                          color: Colors.black,
                        ),
                        SizedBox(height: 8),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 20, // Reduced font size for better fit
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}