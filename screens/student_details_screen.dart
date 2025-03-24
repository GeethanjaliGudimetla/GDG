import 'package:flutter/material.dart';
import 'package:s_test/models/student.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student student;

  StudentDetailsScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Roll Number: ${student.rollNumber}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Marks: ${student.marks.join(", ")}'),
            Text('Average: ${student.average.toStringAsFixed(2)}'),
            Text('Percentage: ${student.percentage.toStringAsFixed(2)}%'),
            Text('Feedback: ${student.feedback}', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
