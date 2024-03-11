import 'dart:io';
import 'package:andand/home.dart';
import 'package:andand/uploadConfirm.dart';
import 'package:flutter/material.dart';
import 'package:andand/util/color.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:andand/photoComplete.dart';

class InputImg extends StatefulWidget {
  @override
  _InputImgState createState() => _InputImgState();
}

class _InputImgState extends State<InputImg> {
  File? _image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    try {
      final XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LightAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      '#웃음',
                      style: TextStyle(
                        color: Color.fromARGB(255, 188, 188, 188),
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.043,
                        decoration: BoxDecoration(
                          color: lightColorScheme.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: IconButton(
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          },
                          icon: Row(
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.038,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '홈 돌아가기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.032,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              _buildPhotoArea(),
              SizedBox(height: 20),
              _buildButton(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoArea() {
    return _image != null
        ? Container(
            width: 200,
            height: 200,
            child: Image.file(_image!),
          )
        : Container(
            width: 200,
            height: 200,
            child: Image.asset('assets/sky.png'),
          );
  }

  Widget _buildButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         ElevatedButton(
          onPressed: () {
            getImage(ImageSource.gallery);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black),
            ),
            minimumSize: Size(170.0, 40.0),
          ),
          child: Text(
            '사진 가져오기',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Set the text to bold
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.camera);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black),
            ),
            minimumSize: Size(170.0, 40.0),
          ),
          child: Text(
            '사진 찍기',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Set the text to bold
            ),
          ),
        ),
        SizedBox(height: 10),

        ElevatedButton.icon(
          onPressed: () {
            if (_image != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => uploadConfirm(image: _image!),
                ),
              );
            }
          },
          icon: Icon(Icons.check),
          label: Text('확인'),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 188, 188, 188),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            minimumSize: Size(40.0, 40.0),
          ),
        ),
      ],
    );
  }
}
