  import 'package:andand/util/color.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import '../main.dart';
  import '../widget/lightappbar.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_code_connect.dart';

  class Login_newRegister extends StatefulWidget {
    const Login_newRegister({Key? key}) : super(key: key);

    @override
    State<Login_newRegister> createState() => _Login_newRegisterState();
  }

  class _Login_newRegisterState extends State<Login_newRegister> {
    DateTime? tempPickedDate;
    DateTime _selectedDate = DateTime.now();

    final _formKey = GlobalKey<FormState>();
    String username = '';
    String phoneNum = '';
    String birth = '';

    void _tryValidation() async {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();

        try {
          // Firestore를 사용하여 'users' 컬렉션에 사용자 데이터를 추가합니다.
          DocumentReference documentReference = await FirebaseFirestore.instance.collection('users').add({
            'name': username,
            'phoneNum': phoneNum,
            'birth': birth,
          });

          // Get the document ID
          String docID = documentReference.id;

          // 데이터 저장이 성공하면 다음 화면으로 이동하거나 필요한 로직을 수행합니다.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginCodeConnect(docID: docID)),  // 'NextScreen'을 원하는 화면으로 바꿉니다.
          );
        } catch (e) {
          // 데이터 저장 중 오류 처리
          print('Error saving user data: $e');
        }
      }
    }


    @override
    Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      return Scaffold(
        appBar: LightAppBar(),
        backgroundColor: Color(0xffF6F6F6),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: this._formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  buildProfileImageAndCameraIcon(context),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    width: screenWidth * 0.9,
                    child: Divider(color: lightColorScheme.primary), // Change to your color
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                      child : Text(
                      "회원정보를 입력해주세요",
                      style: TextStyle(
                        color: lightColorScheme.primary, // Change to your color
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text("이름", style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  customTextFormField(
                    onSaved: (value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return '이름은 2자 이상이 되어야합니다';
                      } else {
                        return null;
                      }
                    },
                    hintText: '이름을 입력하세요',
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text("생년월일", style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  customTextFormField(
                    onSaved: (value) {
                      setState(() {
                        birth = value!;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        birth = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length != 8) {
                        return '생년월일을 정확히 입력해주세요';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'YYYYMMDD',
                    keyboardType: TextInputType.phone,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text("전화번호", style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  customTextFormField(
                    onSaved: (value) {
                      setState(() {
                        phoneNum = value!;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        phoneNum = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length != 11) {
                        return '전화번호를 정확히 입력해주세요';
                      } else {
                        return null;
                      }
                    },
                    hintText: '전화번호를 입력하세요',
                    keyboardType: TextInputType.phone,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: screenWidth * 0.8,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: lightColorScheme.primary ,
                        child: IconButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _tryValidation();
                            }
                          },
                          icon: Icon(Icons.arrow_forward, color: Colors.white),
                          iconSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget buildProfileImageAndCameraIcon(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.065,
                      backgroundImage: AssetImage('assets/your_image.png'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.10,
                right: MediaQuery.of(context).size.width * 0.33,
                child: InkWell(
                  onTap: () {
                    // Handle icon tap if needed
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.033,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: MediaQuery.of(context).size.width * 0.045,
                      color: lightColorScheme.primary, // Change to your color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget customTextFormField({
      required ValueChanged<String> onChanged,
      required FormFieldSetter<String> onSaved,
      required FormFieldValidator<String> validator,
      required String hintText,
      required TextInputType keyboardType,
    }) {
      return TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyboardType,
        // inputFormatters를 비워 문자 입력 허용
        // inputFormatters: [
        //   FilteringTextInputFormatter.digitsOnly, // Allow only numeric input
        // ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightColorScheme.primary),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: lightColorScheme.outline,
          ),
          contentPadding: EdgeInsets.all(10),
        ),
      );
    }

  }

