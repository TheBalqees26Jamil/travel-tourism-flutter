import 'package:flutter/material.dart';
import 'welcome_screen.dart';

void main() => runApp(const ResortApp());

class ResortApp extends StatelessWidget {
  const ResortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luxury Resorts',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(),
    );
  }
}