import 'package:flutter/material.dart';

void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Student Attendance")),
        body: const Center(child: Text("Welcome to Attendance App")),
      ),
    );
  }
}
