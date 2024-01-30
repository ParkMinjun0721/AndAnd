import 'package:flutter/material.dart';
import 'package:andand/widget/baseappbar.dart';
import 'package:andand/widget/bottomNavi.dart';


class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LightAppBar({Key? key}) : super(key: key);

  static const IconData arrowBackIcon = IconData(
    0xf571,
    fontFamily: 'MaterialIcons',
    matchTextDirection: true,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool automaticallyImplyLeading;
    // width: screenWidth * 0.9,
    // height: screenHeight * 0.6,
    return AppBar(
      backgroundColor: Color(0xFF87BD9D).withOpacity(0.05),
      automaticallyImplyLeading: false,
      elevation: 0.3,
      flexibleSpace: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              padding: const EdgeInsets.only(top: 10, left: 5),
              icon: Icon(arrowBackIcon),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: screenWidth * 0.3),
            Image.asset(
              'assets/andlogo.png',
              height: screenHeight * 0.5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
