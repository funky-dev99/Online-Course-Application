import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_course_application/colors.dart';
import 'package:online_course_application/components/custom_button.dart';
import 'package:online_course_application/components/custom_textfield.dart';
import 'package:online_course_application/components/loading.dart';
import 'package:online_course_application/pages/courses_page.dart';

import '../methods/commonMethods.dart';

///Email: shahiru@gmail.com
///PW: shahi123


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable() async {
    await cMethods.checkConnectivity(context);
    signInFormValidation();
  }

  signInFormValidation() {
    if (!emailOrPhoneController.text.contains('@')) {
      snackBar(context, 'Please enter a valid email', Colors.redAccent);
    } else if (passwordController.text.trim().length < 6) {
      snackBar(context, 'Your password must be 6 or more characters', Colors.redAccent);
    } else {
      signInUser();
    }
  }

  signInUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => LoadingDialog(messageText: 'Allowing you to login...'),
    );

    try {
      final User? userFirebase = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailOrPhoneController.text.trim(),
        password: passwordController.text.trim(),
      )).user;

      if (!context.mounted) return;
      Navigator.pop(context);

      if (userFirebase != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CoursesPage()),
        );
      } else {
        snackBar(context, 'Login failed. Please try again.', Colors.red);
      }
    } catch (error) {
      Navigator.pop(context);
      snackBar(context, 'Incorrect email or password!', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appRichBlack,
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
              CustomTextField(
                controller: emailOrPhoneController,
                hintText: 'Email address',
                hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {},
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
                onPressed: () => checkIfNetworkIsAvailable(),
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
