import 'package:flutter/material.dart';
import 'package:andand/widget/bottomNavi.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:andand/util/color.dart';

class oneFlower extends StatefulWidget {
  const oneFlower({Key? key}) : super(key: key);

  @override
  State<oneFlower> createState() => _oneFlowerState();
}

class _oneFlowerState extends State<oneFlower> {
  String name1 = "도현미";
  String name2 = "안하경";
  final PageController _pageController = PageController(initialPage: 0);
  final int _currentPage = 0;
  DateTime date = DateTime.now(); // Replace with your actual date
  String description = "지나가다가 튤립이 예뻐서 찍었어~^^";
  String me = "하경";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LightAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$name1 ',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: '님과 ',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '$name2 ',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: '님의 도감',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F1F1),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.58,
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                child: Image.asset(
                                  'assets/your_image.png', // Replace with your image path
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: MediaQuery.of(context).size.height *
                                      0.25, // Adjust the height as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height * 0.27,
                              left: MediaQuery.of(context).size.width * 0.05,
                              child: Text(
                                '${date.year}.${date.month}.${date.day}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.28,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.edit_outlined,
                                    color: lightColorScheme.primary,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.delete_outlined,
                                    color: lightColorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height * 0.13,
                              left: MediaQuery.of(context).size.width * 0.165,
                              right: MediaQuery.of(context).size.width * 0.165,
                              child: Text(
                                description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      16.0, // Adjust the font size as needed
                                  color: Color.fromARGB(255, 108, 107, 107), // Adjust the text color as needed
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height * 0.01,
                              left: MediaQuery.of(context).size.width * 0.5,
                              right: MediaQuery.of(context).size.width * 0.0,
                              child: Text(
                                me,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      16.0, // Adjust the font size as needed
                                  color: Colors.black, // Adjust the text color as needed
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(
        selectedIndex: 0,
        onItemTapped: (index) {
          print('Selected Index: $index');
        },
      ),
    );
  }
}
