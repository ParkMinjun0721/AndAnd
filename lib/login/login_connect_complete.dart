import 'package:andand/login/login_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import '../widget/lightappbar.dart';
import 'package:andand/login/login_code_connect.dart';


class LoginConnectComplete extends StatefulWidget {
  final String docID;

  const LoginConnectComplete({super.key, required String this.docID});

  @override
  State<LoginConnectComplete> createState() => _LoginConnectCompleteState();
}
Future<String> getNameFromFirestore(String userID) async {
  try {
    var documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(userID).get();
    return documentSnapshot['name'] ?? '';
  } catch (error) {
    print('Error getting name from Firestore: $error');
    return '';
  }
}

class _LoginConnectCompleteState extends State<LoginConnectComplete> {
  String name = "";

  void initState() {
    super.initState();
    // initState에서 비동기 함수 호출하여 값을 가져옵니다.
    getNameFromFirestore(widget.docID).then((value) {
      setState(() {
        name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(backgroundColor: LoginPage.backgroundMain,
      appBar: const LightAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/bear_welcome.png', fit: BoxFit.contain, height: 188,),
                  const SizedBox(height: 40),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginText("환영합니다!", fontSize: 18, fontWeight: FontWeight.bold),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loginText(name, fontSize: 18, fontWeight: FontWeight.bold, color: LoginPage.mainColor),
                          loginText("님의 하루하루를 응원해요!", fontSize: 18, fontWeight: FontWeight.bold),
                        ],
                      ),
                  ],),
                ],
              ),
            ),
          ),
          Container(margin: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Update connect code in docID's data
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  child : loginContainer_green("오늘 하루 시작하기", screenWidth),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
