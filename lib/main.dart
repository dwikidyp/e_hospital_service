import 'package:e_hospital_service/auth_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EHospitalApp());
}

class EHospitalApp extends StatelessWidget {
  const EHospitalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Hospital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B5FE8)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const AuthPage(),
    );
  }
}
