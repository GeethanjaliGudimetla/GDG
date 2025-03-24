import 'package:flutter/material.dart';
import 'package:s_test/models/student.dart';


class StudentProvider extends ChangeNotifier {
  List<Student> students = [];

  void addStudent(String rollNumber, List<int> marks) {
    students.add(Student(rollNumber: rollNumber, marks: marks));
    notifyListeners();
  }
}
