import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import 'package:andand/widget/lightappbar.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
      appBar: BaseAppBar(),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/bear_use_labtop.png'),
                    ),
                  ],
                ),
                Container(width: screenWidth*0.9, child: Divider(color: LoginPage.mainColor)),
                Column(
                  children: [
                    Container(width: screenWidth*0.8,
                      child: TextFormFieldComponent(false, TextInputType.name,TextInputAction.next, "홍길동", 20, "이름은 2자 이상입니다."),
                    ),
                    Container(width: screenWidth*0.8,
                      child: TextFormFieldComponent(false, TextInputType.datetime,TextInputAction.next, "생년월일", 20, "이름은 2자 이상입니다."),
                    ),
                    Container(width: screenWidth*0.8,
                      child: TextFormFieldComponent(false, TextInputType.phone,TextInputAction.next, "01XXXXXXXXX", 20, "이름은 2자 이상입니다."),
                    ),
                    Container(width: screenWidth*0.8,
                      child: TextFormFieldComponent(false, TextInputType.text,TextInputAction.next, "전화번호 인증", 6, "이름은 2자 이상입니다."),
                    )
                  ],
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}

Widget TextFormFieldComponent(bool obscureText, TextInputType keyboardType, TextInputAction textInputAction,String hintText, int maxSize, String errorMessage ){
  return Container(
    child: TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide.none),
        fillColor: Colors.white,
      ),
      validator: (value){
        if (value!.length < maxSize) {
          return errorMessage;
        }
      },
    ),
  );
}
