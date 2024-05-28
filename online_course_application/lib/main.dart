import 'package:flutter/material.dart';
import 'package:online_course_application/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manrope',
        // Define other theme properties if needed
      ),
      debugShowCheckedModeBanner: false,
      home:  const SplashScreen(),
    );
  }
}
