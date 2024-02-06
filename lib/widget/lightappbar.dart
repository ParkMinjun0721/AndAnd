import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFF87BD9D).withOpacity(0.05),
      automaticallyImplyLeading: false,
      elevation: 0.3,
      flexibleSpace: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              padding: const EdgeInsets.only(top: 10, left: 10),
              icon: const Icon(arrowBackIcon),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: screenWidth * 0.3), // Adjust the spacing as needed
            Center(
              child: Image.asset(
                'assets/andlogo.png',
                height: screenHeight * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
