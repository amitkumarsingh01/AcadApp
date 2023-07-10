import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate Your Marks Status',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: SliderScreen(),
    );
  }
}

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double cie1Value = 0;
  double cie2Value = 0;
  double cie3Value = 0;
  double aatValue = 0;
  double quizValue = 0;
  double labRecordValue = 0;
  double internalLabExamValue = 0;
  double semesterEndValue = 0;
  String dropdownValue = 'Subject Without Lab';

  @override
  Widget build(BuildContext context) {
    double result1 = (cie1Value / 50) * (dropdownValue == 'Subject Without Lab' ? 10 : 6);
    double result2 = (cie2Value / 50) * (dropdownValue == 'Subject Without Lab' ? 10 : 6);
    double result3 = (cie3Value / 50) * (dropdownValue == 'Subject Without Lab' ? 10 : 6);
    double result4 = (aatValue / 10) * (dropdownValue == 'Subject Without Lab' ? 10 : 6);
    double result5 = (quizValue / 10) * (dropdownValue == 'Subject Without Lab' ? 10 : 6);
    double result6 = (labRecordValue / 30) * 12;
    double result7 = (internalLabExamValue / 50) * 8;
    double result8 = (semesterEndValue / 100) * 50;

    double totalMarks = result1 + result2 + result3 + result4 + result5 + result6 + result7 + result8;
    double totalMarks2 = result1 + result2 + result3 + result4 + result5 + result8;

    String grade = '';

    if (totalMarks >= 90) {
      grade = 'O Outstanding';
    } else if (totalMarks >= 80) {
      grade = 'A+ Excellent';
    } else if (totalMarks >= 70) {
      grade = 'A Very Good';
    } else if (totalMarks >= 60) {
      grade = 'B+ Good';
    } else if (totalMarks >= 55) {
      grade = 'B Above Average';
    } else if (totalMarks >= 50) {
      grade = 'C Average';
    } else if (totalMarks >= 40) {
      grade = 'P PASS';
    } else {
      grade = 'F Fail';
    }

    String grade2 = '';

    if (totalMarks2 >= 90) {
      grade2 = 'O Outstanding';
    } else if (totalMarks2 >= 80) {
      grade2 = 'A+ Excellent';
    } else if (totalMarks2 >= 70) {
      grade2 = 'A Very Good';
    } else if (totalMarks2 >= 60) {
      grade2 = 'B+ Good';
    } else if (totalMarks2 >= 55) {
      grade2 = 'B Above Average';
    } else if (totalMarks2 >= 50) {
      grade2 = 'C Average';
    } else if (totalMarks2 >= 40) {
      grade2 = 'P PASS';
    } else {
      grade2 = 'F Fail';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Your Marks Status'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.tealAccent.shade100],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text('Choose Your Subject Type', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Subject Without Lab',
                    child: Text('Subject Without Lab'),
                  ),
                  DropdownMenuItem(
                    value: 'Subject With Lab',
                    child: Text('Subject With Lab'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('CIE 1: ${cie1Value.toInt()}'),
              Slider(
                min: 0,
                max: 50,
                value: cie1Value,
                onChanged: (value) {
                  setState(() {
                    cie1Value = value;
                  });
                },
              ),
              Text('CIE 2: ${cie2Value.toInt()}'),
              Slider(
                min: 0,
                max: 50,
                value: cie2Value,
                onChanged: (value) {
                  setState(() {
                    cie2Value = value;
                  });
                },
              ),
              Text('CIE 3: ${cie3Value.toInt()}'),
              Slider(
                min: 0,
                max: 50,
                value: cie3Value,
                onChanged: (value) {
                  setState(() {
                    cie3Value = value;
                  });
                },
              ),
              Text('AAT: ${aatValue.toInt()}'),
              Slider(
                min: 0,
                max: 10,
                value: aatValue,
                onChanged: (value) {
                  setState(() {
                    aatValue = value;
                  });
                },
              ),
              Text('Quiz: ${quizValue.toInt()}'),
              Slider(
                min: 0,
                max: 10,
                value: quizValue,
                onChanged: (value) {
                  setState(() {
                    quizValue = value;
                  });
                },
              ),
              if (dropdownValue == 'Subject With Lab') ...[
                Text('Lab Record: ${labRecordValue.toInt()}'),
                Slider(
                  min: 0,
                  max: 30,
                  value: labRecordValue,
                  onChanged: (value) {
                    setState(() {
                      labRecordValue = value;
                    });
                  },
                ),
                Text('Internal Lab Exam: ${internalLabExamValue.toInt()}'),
                Slider(
                  min: 0,
                  max: 50,
                  value: internalLabExamValue,
                  onChanged: (value) {
                    setState(() {
                      internalLabExamValue = value;
                    });
                  },
                ),
              ],
              Text('Semester End: ${semesterEndValue.toInt()}'),
              Slider(
                min: 0,
                max: 100,
                value: semesterEndValue,
                onChanged: (value) {
                  setState(() {
                    semesterEndValue = value;
                  });
                },
              ),
              SizedBox(height: 30),
              // Text('CIE 1 Result: ${result1.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('CIE 1 Result: ${result1.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('CIE 2 Result: ${result2.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('CIE 3 Result: ${result3.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('AAT Result: ${result4.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Quiz Result: ${result5.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              if (dropdownValue == 'Subject With Lab') ...[
                Text('Lab Record Result: ${result6.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Internal Lab Exam Result: ${result7.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
              Text('Semester End Result: ${result8.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              if (dropdownValue == 'Subject With Lab') ...[
                Text('Total Marks: ${totalMarks.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('Grade: $grade', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ] else ...[
                Text('Total Marks: ${totalMarks2.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('Grade: $grade2', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ],
              // SizedBox(height: 20),
              // Text('Grade: $grade', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),

            ],
          ),
        ),
      ),
    );
  }
}
