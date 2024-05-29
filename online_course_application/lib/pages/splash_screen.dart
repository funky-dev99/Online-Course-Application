import 'package:flutter/material.dart';
import 'package:online_course_application/colors.dart';
import 'package:online_course_application/components/custom_button.dart';

import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appRichBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
                width: double.infinity,
              ),
              Image.asset(
                'images/logo-element.png',
                height: 38,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Unlock Your Potential',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              const Text(
                'With your Companion on the \nLearning Journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),

              const SizedBox(height: 15,),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                childText: 'Start Studying',
              ),

              const SizedBox(height: 30,),
              
              Image.asset("images/splash-screen-img.png")


            ],
          ),
        ),
      ),
    );
  }
}
