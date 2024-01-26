import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  static const IconData arrowBackIcon = IconData(
    0xf571,
    fontFamily: 'MaterialIcons',
    matchTextDirection: true,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return AppBar(
      backgroundColor: Color(0xFF87BD9D).withOpacity(0.05),
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
            SizedBox(width: screenWidth * 0.31),
            Image.asset(
              'assets/andlogo.png',
              height: screenHeight * 0.4,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
