import 'package:andand/login/login_main.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:andand/login/login_code_connect.dart';
import 'login_connect_complete.dart';

class LoginConnectConfirm extends StatefulWidget {
  final String docID;
  final String enteredCode;

  const LoginConnectConfirm({Key? key, required this.docID, required this.enteredCode,}) : super(key: key);

  @override
  State<LoginConnectConfirm> createState() => _LoginConnectConfirmState();
}

class _LoginConnectConfirmState extends State<LoginConnectConfirm> {
  String conname = "";

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
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/bear_use_labtop.png'),
                  ),
                  SizedBox(height: 40),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder(
                        // Use FutureBuilder to asynchronously get the conname from Firestore
                        future: getNameFromFirestore(widget.enteredCode),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else {
                            // Display conname when Future is completed
                            conname = snapshot.data as String;
                            return loginText(conname, fontSize: 20, fontWeight: FontWeight.bold, color: LoginPage.mainColor);
                          }
                        },
                      ),
                      loginText(" 님과 연결하시겠습니까?", fontSize: 20, fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Update connect code in docID's data
                    updateConnectCodeInFirestore(widget.docID, widget.enteredCode);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginConnectComplete()));
                  },
                  child: loginContainer_green("연결하기", screenWidth),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate back to the previous page
                    Navigator.pop(context);
                  },
                  child: loginContainer_white("취소", screenWidth),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }

  Future<void> updateConnectCodeInFirestore(String docID, String enteredCode) async {
    try {
      // Update connectCode in docID's data
      await FirebaseFirestore.instance.collection('users').doc(docID).update({
        'connectCode': enteredCode,
      });

      // Update connectCode in enteredCode's data
      await FirebaseFirestore.instance.collection('users').doc(enteredCode).update({
        'connectCode': docID,
      });

      // Retrieve names from Firestore
      String docIDName = await getNameFromFirestore(docID);
      String enteredCodeName = await getNameFromFirestore(enteredCode);

      // Update connectName in enteredCode's data
      await FirebaseFirestore.instance.collection('users').doc(enteredCode).update({
        'connectName': '$docIDName',
      });

      // Update connectName in docID's data
      await FirebaseFirestore.instance.collection('users').doc(docID).update({
        'connectName': '$enteredCodeName',
      });

      print('Connect code and names updated successfully');
    } catch (error) {
      print('Error updating connect code and names: $error');
    }
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

}


