import 'dart:io';
import 'package:andand/home.dart';
import 'package:andand/inputimg.dart';
import 'package:flutter/material.dart';
import 'package:andand/util/color.dart';
import 'package:andand/widget/lightappbar.dart';
import 'package:andand/photoComplete.dart';

class uploadConfirm extends StatefulWidget {
  final File image;

  const uploadConfirm({Key? key, required this.image}) : super(key: key);

  @override
  State<uploadConfirm> createState() => _uploadConfirmState();
}

class _uploadConfirmState extends State<uploadConfirm> {
  String keywordText = '웃음'; // Set the initial value of the keyword

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LightAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  child: Text(
                    '#$keywordText',
                    style: TextStyle(
                      color: Color.fromARGB(255, 188, 188, 188),
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0), // Add horizontal padding
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0), // Add padding below the button
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height *
                          0.043, // Adjust the width of the container
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
                              size: MediaQuery.of(context).size.width *
                                  0.038, // Adjust the size of the icon
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '홈 돌아가기',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width *
                                    0.032, // Adjust the size of the text
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
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.73,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 188, 188, 188),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.file(
                      widget.image,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '사진을 업로드하시겠습니까?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InputImg()),
                            );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // Adjust the radius as needed
                            side: BorderSide(color: Colors.black),
                          ),
                          primary: Colors
                              .white, // Set the background color of the button
                          onPrimary: Colors.black, // Set the text color
                          minimumSize: Size(110.0, 40.0),
                        ),
                        child: Text(
                          '다시 찍기',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Set the text to bold
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the '확인' button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  photoComplete(), // Replace with the actual page widget
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // Adjust the radius as needed
                          ),
                          primary: Colors
                              .black, // Set the background color of the button
                          onPrimary: Colors.white, // Set the text color
                          minimumSize: Size(110.0, 40.0),
                        ),
                        child: Text(
                          '확인',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Set the text to bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
