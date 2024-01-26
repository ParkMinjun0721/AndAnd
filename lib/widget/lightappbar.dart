import 'package:flutter/material.dart';
import 'package:andand/widget/baseappbar.dart';
import 'package:andand/widget/bottomNavi.dart';


class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  static const IconData arrowBackIcon = IconData(
    0xf571,
    fontFamily: 'MaterialIcons',
    matchTextDirection: true,
  );

  @override
  Widget build(BuildContext context) {
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
            SizedBox(width: 135),
            Image.asset(
              'assets/andlogo.png',
              height: 45,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
