import 'package:flutter/material.dart';
import '../components/custom_textfield.dart';
import 'business_page.dart';
import 'design_page.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final searchController = TextEditingController();

  List<Map<String, dynamic>> categories = [
    {"imagePath": "images/business.png", "title": "Business", "height": 141},
    {"imagePath": "images/computing.png", "title": "Computing", "height": 161},
    {"imagePath": "images/medicine.png", "title": "Medicine", "height": 187},
    {"imagePath": "images/law.png", "title": "Law", "height": 141},
    {"imagePath": "images/engineering.png", "title": "Engineering", "height": 151},
    {"imagePath": "images/finance.png", "title": "Finance", "height": 141},
    {"imagePath": "images/health.png", "title": "Health", "height": 161},
    {"imagePath": "images/design.png", "title": "Design", "height": 161},
  ];

  List<Map<String, dynamic>> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = List.from(categories);
  }

  void search(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResults = List.from(categories);
      } else {
        searchResults = categories
            .where((category) =>
            category['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void handleCategoryTap(String categoryTitle) {
    if (categoryTitle == "Business") {
      // Navigate to the Business page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BusinessPage()),
      );
    } else if (categoryTitle == "Design") {
      // Navigate to the Design page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DesignPage()),
      );
    } else {
      // Handle other categories if needed
      print('Tapped on category: $categoryTitle');
    }
  }



  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'images/logo-element.png',
            width: 35,
            height: 35,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'images/menu.png',
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'images/notification.png',
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10), // Add 10 units of padding
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        'What do you want to Learn today? 💻',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  CustomTextField(
                    inputTextColor: Colors.black,
                    controller: searchController,
                    hintText: 'Search for a course',
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        search(searchController.text);
                      },
                      icon: Image.asset(
                        'images/right arrow purple.png',
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (var category in searchResults)
                        GestureDetector(
                          onTap: () {
                            handleCategoryTap(category['title']);
                          },
                          child: Image.asset(
                            category['imagePath'],
                            height: category['height'].toDouble(), // Convert to double
                            width: 159,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 18,
            left: 20,
            right: 20,
            height: 80,
            child: Image.asset('images/navbar.png'),
          ),
        ],
      ),
    );
  }
}
