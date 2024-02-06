import 'package:andand/login/login_code_connect.dart';
import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:andand/util/color.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  final TextEditingController _BirthdayController =
  TextEditingController(text: '');
  DateTime? tempPickedDate;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    localizationsDelegates: [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
    supportedLocales: [
      const Locale('ko', 'KR'), // 한국어 지원
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    return Scaffold(backgroundColor: LoginPage.backgroundMain,
        appBar: const LightAppBar(),
        body: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: MediaQuery.of(context).size.height * 0.065,
                                    backgroundImage: const AssetImage('assets/your_image.png'),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.013,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.10,
                              right: MediaQuery.of(context).size.width * 0.40,
                              child: InkWell(
                                onTap: () {
                                  // Handle icon tap if needed
                                },
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.033,
                                  backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: MediaQuery.of(context).size.width * 0.045,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 10), width : screenWidth*0.9, child: const Divider(color: LoginPage.mainColor)),
                    Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child:
                        loginText("회원정보를 입력해주세요", color: LoginPage.mainColor, fontWeight: FontWeight.bold, fontSize: 20)),
                    Column(
                      children: [
                        SizedBox(width: screenWidth*0.8,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),child: const Text("이름",style: TextStyle(fontWeight: FontWeight.w600))),
                              TextFormFieldComponent(false, TextInputType.name,TextInputAction.next, "홍길동", 20, "이름은 2자 이상입니다."),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth*0.8,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BirthdayText(screenHeight*0.4),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth*0.8,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),child: const Text("전화번호",style: TextStyle(fontWeight: FontWeight.w600))),
                              TextFormFieldCall(false, TextInputType.phone,TextInputAction.next, "01XXXXXXXXX", 11, "이름은 2자 이상입니다.",screenWidth),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth*0.8,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start  ,
                            children: [
                              Container(margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),child: const Text("전화번호 인증",style: TextStyle(fontWeight: FontWeight.w600))),
                              TextFormFieldComponent(false, TextInputType.text,TextInputAction.next, "", 6, "이름은 2자 이상입니다."),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0) ,width: screenWidth*0.8,child: Container(alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 30  ,
                          backgroundColor: LoginPage.mainColor,
                          child: IconButton(onPressed: (){
                            // Navigator.pushNamed(context, '/login_code_connect');
                          }, icon: const Icon(Icons.arrow_forward, color: Colors.white,),iconSize: 30,),
                        )
                    ),),
                  ],
                )
            ),
          ),
        )
    );
  }
  Widget BirthdayText(double height) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _selectDate(height);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),child: const Text("생년월일",style: TextStyle(fontWeight: FontWeight.w600))),
          TextFormFieldAge(false, TextInputType.datetime,TextInputAction.next, "생년월일", 20, "이름은 2자 이상입니다.",_BirthdayController),
        ],
      ),
    );
  }

  _selectDate(double height) async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      backgroundColor: ThemeData.light().scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        // DateTime tempPickedDate;
        return SizedBox(
          height: height,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: const Text('취소'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    CupertinoButton(
                      child: const Text('완료'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    backgroundColor: ThemeData.light().scaffoldBackgroundColor,
                    minimumYear: 1900,
                    maximumYear: DateTime.now().year,
                    initialDateTime: DateTime(2000,1,1),
                    maximumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                    dateOrder: DatePickerDateOrder.ymd,

                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _BirthdayController.text = pickedDate.toString();
        convertDateTimeDisplay(_BirthdayController.text);
      });
    }
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    return _BirthdayController.text = serverFormater.format(displayDate);
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
        hintStyle: const TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide.none),
        fillColor: Colors.white,
      ),
      validator: (value){
        if (value!.length < maxSize) {
          return errorMessage;
        }
        return null;
      },
    ),
  );
}

Widget TextFormFieldAge(bool obscureText, TextInputType keyboardType, TextInputAction textInputAction,String hintText, int maxSize, String errorMessage, TextEditingController textEditingController){
  return Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
    child: TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide.none),
        fillColor: Colors.white,
        isDense: true,
      ),
      controller: textEditingController,
      validator: (value){
        if (value!.length < maxSize) {
          return errorMessage;
        }
        return null;
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
              hintStyle: const TextStyle(color: Color(0xffADADAD), fontSize: 15, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value!.length < maxSize) {
                return errorMessage;
              }
              return null;
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
      color: const Color(0xffADADAD),
      borderRadius: BorderRadius.circular(5),
    ),
    width: screenWidth * 0.20,
    height: 55,
    child: Center(
      child: loginText(text, color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    ),
  );
}