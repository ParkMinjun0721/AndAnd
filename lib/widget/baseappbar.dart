import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget{
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('되나?'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);

}