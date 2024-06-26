import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_course_application/pages/splash_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
