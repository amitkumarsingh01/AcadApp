import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:y2k/cgpa.dart';
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
  final List<String> chapterTexts = [
    'Check Your Grade',
    'Calculate Your CGPA',
    'Find My Color',
  ];

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academy Analyser'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Explore and Enjoy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 9,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                // Handle page change
              },
            ),
            items: chapterTexts.map((chapterText) {
              return GestureDetector(
                onTap: () {
                  final index = chapterTexts.indexOf(chapterText);
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SliderScreen(),
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CGPACalculator(),
                      ),
                    );
                  }
                  // else if (index == 2) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ColorPage(),
                  //     ),
                  //   );
                  // }
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal.shade300,
                        Colors.teal.shade100,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 250,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  _carouselController.previousPage();
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  _carouselController.nextPage();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
