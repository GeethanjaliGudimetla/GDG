import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_test/providers/student_provider.dart';
import 'package:s_test/screens/student_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentListScreen(),
    );
  }
}
