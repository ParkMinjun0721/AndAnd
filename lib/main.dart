import 'package:andand/login/login_code_connect.dart';
import 'package:andand/login/login_connect_complete.dart';
import 'package:andand/login/login_main.dart';
import 'package:andand/login/login_register.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'util/color.dart';
import 'home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:andand/login/kakao_login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  // KakaoLogin
  KakaoSdk.init(
    nativeAppKey: '639d8451a911fbbf1d4282c34b2d9a3f',
    javaScriptAppKey: '9b3faf53240322a67c32181be7ac8807',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => UserController(
          kakaoLoginApi: KakaoLoginApi(),
        ),
    child: MaterialApp(
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
      home: const App(),
      ),
    );
  }
}

