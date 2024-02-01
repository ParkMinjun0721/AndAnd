import 'package:flutter/material.dart';
import 'splash_page.dart';
import 'util/color.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andand',
      theme: ThemeData(
        primaryColor: lightColorScheme.primary,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
