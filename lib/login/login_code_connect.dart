import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_connect_confirm.dart';

class LoginCodeConnect extends StatefulWidget {
  final String docID;
  const LoginCodeConnect({super.key, required this.docID});

  @override
  State<LoginCodeConnect> createState() => _LoginCodeConnectState();
}

class _LoginCodeConnectState extends State<LoginCodeConnect> {
  String myCode = '';
  String enteredCode = '';

  @override
  void initState() {
    super.initState();
    // Call the method to update the code in Firestore when the page is displayed
    updateCodeInFirestore(widget.docID);
    myCode = widget.docID; // Assign the value of docID to myCode here if needed
  }

  Future<void> updateCodeInFirestore(String docID) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(docID).update({
        'code': docID,
      });
      print('Code updated successfully');
    } catch (error) {
      print('Error updating code: $error');
    }
  }

  Future<void> connectWithCode() async {
    if (enteredCode.isNotEmpty) {
      try {
        var documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(enteredCode).get();

        if (documentSnapshot.exists) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginConnectConfirm(docID: widget.docID, enteredCode: enteredCode,),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("잘못된 코드"),
                content: Text("잘못된 코드를 입력하셨습니다. 다시 입력해주세요."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("확인"),
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        print('Error updating connect code: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: LoginPage.backgroundMain,
      appBar: LightAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/bear_use_labtop.png', fit: BoxFit.contain, height: 188,),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 46, 0, 15),
                    child: loginText("나의 코드 복사", color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('클립보드에 복사되었습니다: $myCode'),
                            backgroundColor: LoginPage.mainColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                          ),
                        );
                      },
                      child: loginText(myCode, color: Colors.black, fontSize: 23, fontWeight: FontWeight.normal, textDecoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: loginText("상대방 코드를 입력해주세요", fontSize: 15,),
                  ),
                  Container(
                    width: screenWidth * 0.8,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value){
                        enteredCode = value;
                      },
                      decoration: InputDecoration(
                        hintText: '코드 입력',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                        hintStyle: TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      connectWithCode();
                    },
                    child: loginContainer_green("연결하기", screenWidth),
                  ),
                  loginContainer_white("나중에 연결하기", screenWidth),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Text loginText(String text, {Color color = Colors.black, double fontSize = 14.0, FontWeight fontWeight = FontWeight.normal, TextDecoration textDecoration = TextDecoration.none }) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDecoration,
    ),
  );
}

Container loginContainer_white(String text, double screenWidth, {Color textColor = Colors.black, double fontSize = 17.0, FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(style: BorderStyle.none),
    ),
    width: screenWidth * 0.8,
    height: 50,
    child: Center(
      child: loginText(text, color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    ),
  );
}
Container loginContainer_green(String text, double screenWidth, {Color textColor = Colors.white, double fontSize = 17.0, FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(
      color: LoginPage.mainColor,
      borderRadius: BorderRadius.circular(5),
    ),
    width: screenWidth * 0.8,
    height: 50,
    child: Center(
      child: loginText(text, color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    ),
  );
}
