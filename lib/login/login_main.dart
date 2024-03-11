import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'new_login_register.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:provider/provider.dart';
import 'package:andand/login/kakao_login.dart';

Future<UserCredential> signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const mainColor = Color(0xff87BD9D);
  static const backgroundMain = Color(0xffF6F6F6);

  @override
  Widget build(BuildContext context) {
    return Container(color: backgroundMain,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Image.asset('assets/logo_green_with_and.png'),
                  ),
                  Container(
                    child: Text('앤드앤드',
                        style: TextStyle(
                          fontSize: 15,
                          color: mainColor,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        )),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: GestureDetector(
                    onTap: context.read<UserController>().kakaoLogin,
                      child: Image.asset('assets/login_kakaotalk.png')),
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    // Call the signInWithGoogle function when the image is tapped
                    UserCredential userCredential = await signInWithGoogle(context);

                    // Check if the login was successful before navigating
                    if (userCredential.user != null) {
                      // Navigate to the main page (replace with your main page class)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login_newRegister()),
                      );
                    }
                  } catch (e) {
                    print("Error during sign in with Google: $e");
                  }
                },
                child: Container(
                  child: Image.asset('assets/login_google.png'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
