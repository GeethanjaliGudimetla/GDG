import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_test/providers/student_provider.dart';
import 'package:s_test/screens/student_details_screen.dart';

class StudentListScreen extends StatefulWidget {
  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final _rollNumberController = TextEditingController();
  final _marksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Student Performance Analysis')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _rollNumberController,
              decoration: InputDecoration(labelText: 'Enter Roll Number'),
            ),
            TextField(
              controller: _marksController,
              decoration: InputDecoration(labelText: 'Enter Marks (comma-separated)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String rollNumber = _rollNumberController.text.trim();
                List<int> marks = _marksController.text.split(',')
                    .map((e) => int.tryParse(e.trim()) ?? 0)
                    .toList();

                if (rollNumber.isNotEmpty && marks.isNotEmpty) {
                  studentProvider.addStudent(rollNumber, marks);
                  _rollNumberController.clear();
                  _marksController.clear();
                }
              },
              child: Text('Add Student'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: studentProvider.students.length,
                itemBuilder: (context, index) {
                  final student = studentProvider.students[index];
                  return ListTile(
                    title: Text('Roll No: ${student.rollNumber}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetailsScreen(student: student),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
