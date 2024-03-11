import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_code_connect.dart';
import 'login_register.dart';
import 'new_login_register.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:provider/provider.dart';
import 'package:andand/login/kakao_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Future<UserCredential> signInWithGoogle(BuildContext context) async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const mainColor = Color(0xff87BD9D);
  static const backgroundMain = Color(0xffF6F6F6);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final TextEditingController _BirthdayController = TextEditingController(text: '');
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final Formkey = GlobalKey<FormState>();
    return Container(color: LoginPage.backgroundMain,
      child: Form(
        key: Formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      child: Image.asset('assets/logo_green_with_and.png'),
                    ),
                    const Text('앤드앤드',
                        style: TextStyle(
                          fontSize: 15,
                          color: LoginPage.mainColor,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        )),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(width: screenWidth*0.8,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: const Text("이름",
                                  style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 15))),
                          // TextFormFieldComponent(false, TextInputType.name,TextInputAction.next, "홍길동", 20, "이름은 2자 이상입니다."),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(style: BorderStyle.none),
                      ),
                      width: screenWidth * 0.8,
                      height: 50,
                      child: Center(
                        child: loginText("로그인하기", color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(style: BorderStyle.none),
                      ),
                      width: screenWidth * 0.8,
                      height: 50,
                      child: Center(
                        child: loginText("회원가입 하기", color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _TextFormFieldComponent(bool obscureText, TextInputType keyboardType,
      TextInputAction textInputAction, String hintText, int maxSize,
      String errorMessage) {
    return Container(decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xffADADAD),
              fontSize: 15,
              fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
        ),
        validator: (value) {
          if (value!.length < maxSize) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}
