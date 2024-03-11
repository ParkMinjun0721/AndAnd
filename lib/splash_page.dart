import 'dart:async';
import 'package:andand/home.dart';
import 'package:andand/login/login_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:andand/util/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    initApp().then((_) {
      checkLoginStatus().then((loggedIn) {
        setState(() {
          isLoggedIn = loggedIn;
        });

        Timer(
          const Duration(seconds: 2),
              () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                isLoggedIn ? const Home() : const LoginPage(),
              ),
            );
          },
        );
      });
    });
  }

  Future<void> initApp() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
  }

  Future<bool> checkLoginStatus() async {
    // You should have your own logic to check if the user is logged in.
    // For example, you can use FirebaseAuth for this purpose.
    // Return true if logged in, false otherwise.
    // Replace this with your actual login status checking logic.
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
