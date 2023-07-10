import 'package:flutter/material.dart';
import 'grade.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academy Analyse',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academy Analyse'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        itemCount: 3,
        itemBuilder: (context, index) {
          // final chapterNumber = index + 1;
          // final chapterTitle = '$chapterNumber';
          final chapterText = '${_getChapterText(index)}';
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SliderScreen(),
                  ),
                );
              }
              // else if (index == 1) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => NumberComparisonGame(),
              //     ),
              //   );
              // } else if (index == 2) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ColorPage(),
              //     ),
              //   );
              // }
            },
            child: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    // Colors.teal.shade200,
                    // Colors.white,
                    Colors.teal.shade100
                  ],
                ),
              ),
              height: 250,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   chapterTitle,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    SizedBox(height: 8),
                    Text(
                      chapterText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getChapterText(int index) {
    switch (index) {
      case 0:
        return 'Check Your Grade';
      case 1:
        return 'Compare Sum of Two Numbers';
      case 2:
        return 'Find My Color';
      default:
        return '';
    }
  }
}
