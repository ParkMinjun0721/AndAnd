import 'package:andand/login/login_code_connect.dart';
import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:intl/intl.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text("Hello, World!"),
              )
            ],
          )
        )
      )
    );
          final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
      appBar: LightAppBar(),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/bear_use_labtop.png'),
                    ),
                  ],
                ),
                Container(margin: EdgeInsets.fromLTRB(0, 30, 0, 10), width : screenWidth*0.9, child: Divider(color: LoginPage.mainColor)),
                Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child:
                  loginText("회원정보를 입력해주세요", color: LoginPage.mainColor, fontWeight: FontWeight.bold, fontSize: 20)),
                Column(
                  children: [
                    Container(width: screenWidth*0.8,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 5),child: Text("이름",style: TextStyle(fontWeight: FontWeight.w600))),
                          TextFormFieldComponent(false, TextInputType.name,TextInputAction.next, "홍길동", 20, "이름은 2자 이상입니다."),
                        ],
                      ),
                    ),
                    Container(width: screenWidth*0.8,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 5),child: Text("생년월일",style: TextStyle(fontWeight: FontWeight.w600))),
                          TextFormFieldComponent(false, TextInputType.datetime,TextInputAction.next, "생년월일", 20, "이름은 2자 이상입니다."),
                        ],
                      ),
                    ),
                    Container(width: screenWidth*0.8,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 5),child: Text("전화번호",style: TextStyle(fontWeight: FontWeight.w600))),
                          TextFormFieldCall(false, TextInputType.phone,TextInputAction.next, "01XXXXXXXXX", 20, "이름은 2자 이상입니다.",screenWidth),
                        ],
                      ),
                    ),
                    Container(width: screenWidth*0.8,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start  ,
                        children: [
                          Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 5),child: Text("전화번호 인증",style: TextStyle(fontWeight: FontWeight.w600))),
                          TextFormFieldComponent(false, TextInputType.text,TextInputAction.next, "", 6, "이름은 2자 이상입니다."),
                        ],
                      ),
                    )
                  ],
                ),
                Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 0) ,width: screenWidth*0.8,child: Container(alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 30  ,
                    backgroundColor: LoginPage.mainColor,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward, color: Colors.white,),iconSize: 30,),
                  )
                  ),),
              ],
            )
          ),
        ),
      )
    );
  }
}

Widget TextFormFieldComponent(bool obscureText, TextInputType keyboardType, TextInputAction textInputAction,String hintText, int maxSize, String errorMessage ){
  return Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
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

Widget TextFormFieldCall(
    bool obscureText,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    String hintText,
    int maxSize,
    String errorMessage,
    double screenWidth // screenWidth 추가
    ) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value!.length < maxSize) {
                return errorMessage;
              }
            },
          ),
        ),
        loginContainer_gray("전화번호 인증하기", screenWidth, textColor: Colors.black, fontSize: 11, fontWeight: FontWeight.w300)
      ],
    ),
  );
}

Container loginContainer_gray(String text, double screenWidth, {Color textColor = Colors.white, double fontSize = 17.0, FontWeight fontWeight = FontWeight.w500}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xffADADAD),
      borderRadius: BorderRadius.circular(5),
    ),
    width: screenWidth * 0.20,
    height: 55,
    child: Center(
      child: loginText(text, color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    ),
  );
}