import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CGPA Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: CGPACalculator(),
    );
  }
}

class CGPACalculator extends StatefulWidget {
  @override
  _CGPACalculatorState createState() => _CGPACalculatorState();
}

class _CGPACalculatorState extends State<CGPACalculator> {
  final TextEditingController creditController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  List<double> credits = [];
  List<double> grades = [];

  double cgpa = 0.0;

  void calculateCGPA() {
    double totalCredits = 0;
    double totalGradePoints = 0;

    for (int i = 0; i < credits.length; i++) {
      double credit = credits[i];
      double grade = grades[i];

      totalCredits += credit;
      totalGradePoints += credit * grade;
    }

    cgpa = totalGradePoints / totalCredits;

    setState(() {});
  }

  void addSubject() {
    double credit = double.tryParse(creditController.text) ?? 0.0;
    double grade = double.tryParse(gradeController.text) ?? 0.0;

    if (credit > 0 && grade >= 0 && grade <= 10) {
      credits.add(credit);
      grades.add(grade);
      creditController.clear();
      gradeController.clear();
      calculateCGPA();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Input'),
            content: Text('Please enter valid credit and grade values.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CGPA Calculator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.tealAccent.shade100],
          ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: creditController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Credit',
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  controller: gradeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Grade',
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: addSubject,
                child: Text('Add'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'CGPA: ${cgpa.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: credits.length,
              itemBuilder: (context, index) {
                double credit = credits[index];
                double grade = grades[index];

                return ListTile(
                  title: Text('Credit: $credit, Grade: $grade'),
                );
              },
            ),
          ),
        ],
        ),
      ),
      )
    );
  }
}
