import 'package:flutter/material.dart';
import 'splash_page.dart';
import 'util/color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
        Locale('ko', 'KR'), // 한국어 지원
    ],
      title: 'Andand',
      theme: ThemeData(
        primaryColor: lightColorScheme.primary,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
