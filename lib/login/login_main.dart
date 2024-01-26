import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const mainColor = Color(0xff87BD9D);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0) ,
                  child: Image.asset('assets/login_kakaotalk.png'),
                ),
                Container(
                  child: Image.asset('assets/login_google.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
