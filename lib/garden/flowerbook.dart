import 'package:flutter/material.dart';
import 'package:andand/widget/bottomNavi.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:andand/util/color.dart';

class FlowerBook extends StatefulWidget {
  const FlowerBook({Key? key}) : super(key: key);

  @override
  State<FlowerBook> createState() => _FlowerBookState();
}

class _FlowerBookState extends State<FlowerBook> {
  String name1 = "도현미";
  String name2 = "안하경";
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _buildPageIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
      ),
    );
  }

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
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04), // 왼쪽 패딩 추가
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
                  color: Color(0xFFF3F1F1),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        '오늘의 꽃',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: MediaQuery.of(context).size.width * 0.52,
                        margin: EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.09),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing:
                              MediaQuery.of(context).size.width * 0.05,
                          mainAxisSpacing:
                              MediaQuery.of(context).size.height * 0.01,
                          shrinkWrap: true,
                          children: List.generate(
                            4,
                            (index) => Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_currentPage > 0) {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => _buildPageIndicator(index),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_currentPage < 3) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: List.generate(
                            4,
                            (index) => Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.1,
                             
                            ),
                          ),
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
