import 'package:flutter/material.dart';

import '../components/custom_textfield.dart';
import 'courses_page.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 50,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesPage()),
              );
            },
            icon: Image.asset(
              'images/left arrow black.png',
              width: 18,
              height: 18,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10), // Add 10 units of padding
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,),
                  child: Text(
                    'Business',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              CustomTextField(
                inputTextColor: Colors.black,
                controller: searchController,
                hintText: 'Search for a course',
                hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {

                  },
                  icon: Image.asset(
                    'images/right arrow purple.png',
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
