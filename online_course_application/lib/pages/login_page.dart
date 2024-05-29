import 'package:flutter/material.dart';
import 'package:online_course_application/colors.dart';
import 'package:online_course_application/components/custom_button.dart';
import 'package:online_course_application/components/custom_textfield.dart'; // Adjust this import to match the location of your colors.dart file

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appRichBlack, // Dark background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'images/logo-text.png',
                width: 80,
              ),
              const SizedBox(height: 100),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Log in to',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Start Learning',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: AppColor.appPowderBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const CustomTextField(
                hintText: 'Email address',
                hintStyle: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
               CustomTextField(
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: Image.asset(
                    'images/eye.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Forgot your Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFADABFF),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 180),

              CustomButton(
                onPressed: () {},
                childText: 'Sign in',
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account yet?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle create account action
                      },
                      child: const Text(
                        'Create Account!',
                        style: TextStyle(
                          color: Color(0xFFADABFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
