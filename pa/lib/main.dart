import 'package:flutter/material.dart';
import 'src/login.dart';

void main() {
  runApp(const RoseDiseaseApp());
}

class RoseDiseaseApp extends StatelessWidget {
  const RoseDiseaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klasifikasi Penyakit Daun Mawar',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}