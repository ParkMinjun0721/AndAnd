import 'dart:io';
import 'package:andand/util/color.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GardenInput extends StatefulWidget {
  @override
  _GardenInputState createState() => _GardenInputState();
}

class _GardenInputState extends State<GardenInput> {
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

  Future<void> uploadImage() async {
    try {
      if (_image != null) {
        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('garden/${DateTime.now().millisecondsSinceEpoch}.png');

        UploadTask uploadTask = storageReference.putFile(_image!);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() async {
          String downloadURL = await storageReference.getDownloadURL();

          CollectionReference images = FirebaseFirestore.instance.collection('images');
          await images.add({
            'url': downloadURL,
            // 다른 필요한 이미지 정보를 추가할 수 있음
          });

          print('Image uploaded successfully!');
        });

        // TaskSnapshot에서 에러 여부 확인
      }
    } catch (e) {
      print('Error uploading image: $e');
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
                          color: lightColorScheme
                              .primary, // Change to your desired color
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Handle the home button press
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
              ElevatedButton(
                onPressed: () {
                  uploadImage();
                },
                child: const Text('저장'),
              ),
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
            getImage(ImageSource.camera);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
              side: BorderSide(color: Colors.black),
            ),
            primary: Colors.white, // Set the background color of the button
            onPrimary: Colors.black, // Set the text color
            minimumSize: Size(150.0, 40.0),
          ),
          child: Text(
            '사진 찍기',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Set the text to bold
            ),
          ),
        ),
        SizedBox(width: 30),
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.gallery);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
            ),
            primary: Colors.black, // Set the background color of the button
            onPrimary: Colors.white, // Set the text color
            minimumSize: Size(150.0, 40.0),
          ),
          child: Text(
            '사진 가져오기',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Set the text to bold
            ),
          ),
        ),
      ],
    );
  }
}
