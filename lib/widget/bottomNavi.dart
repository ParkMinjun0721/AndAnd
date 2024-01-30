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
            icon: FaIcon(FontAwesomeIcons.book, size: 30),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home, size: 30),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 37), // Use Icons.person_rounded here
            label: ' ',
          ),
        ],
        currentIndex: widget.selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 210, 209, 209),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          widget.onItemTapped(index); // Call the provided onTap function

          // Check if the selected index corresponds to the person icon
          if (index == 2) {
            // Navigate to MyPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPage()),
            );
          }
        },
        selectedItemColor: Color(0xFF87BD9D),
      ),
    );
  }
}
