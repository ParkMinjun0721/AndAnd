import 'package:andand/login/login_code_connect.dart';
import 'package:andand/login/login_connect_complete.dart';
import 'package:andand/login/login_main.dart';
import 'package:andand/login/login_register.dart';
import 'package:flutter/material.dart';
import 'util/color.dart';
import 'home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const LoginCodeConnect(),
    );
  }
}

