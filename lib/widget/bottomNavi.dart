import 'package:andand/garden/gardenmain.dart';
import 'package:andand/home.dart'; // 수정된 부분: Home 페이지를 import

import 'package:andand/myPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavi extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavi({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Navigate to GardenMain when the book icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GardenMain()),
                );
              },
              child: FaIcon(FontAwesomeIcons.book, size: 30),
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Navigate to Home when the home icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()), // 수정된 부분: Home 페이지로 이동
                );
              },
              child: FaIcon(FontAwesomeIcons.home, size: 30),
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Navigate to MyPage when the person icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              child: Icon(Icons.person, size: 37),
            ),
            label: ' ',
          ),
        ],
        currentIndex: widget.selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 210, 209, 209),
        type: BottomNavigationBarType.fixed,
        onTap: widget.onItemTapped,
        selectedItemColor: Color(0xFF87BD9D),
      ),
    );
  }
}
