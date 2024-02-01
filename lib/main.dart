import 'package:flutter/material.dart';
import 'splash_page.dart';
import 'util/color.dart';
import 'home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
        Locale('ko', 'KR'), // 한국어 지원
    ],
      title: 'Andand',
      theme: ThemeData(
        primaryColor: lightColorScheme.primary,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
