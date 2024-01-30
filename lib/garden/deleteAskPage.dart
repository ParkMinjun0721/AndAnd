import 'package:flutter/material.dart';
import '../login/login_code_connect.dart';
import '../login/login_main.dart';
import '../util/color.dart';
import '../widget/lightappbar.dart';

class deleteAskPage extends StatefulWidget {
  const deleteAskPage({super.key});

  @override
  State<deleteAskPage> createState() => _GardenCompleteState();
}

class _GardenCompleteState extends State<deleteAskPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Assuming lightColorScheme is an instance of your light theme
    Color primaryColor = lightColorScheme.primary;

    return Scaffold(
      backgroundColor: LoginPage.backgroundMain,
      appBar: const BaseAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth *
                            0.14), // Adjust the left padding value as needed
                    child: Image.asset(
                      'assets/deleteAsk.png',
                      fit: BoxFit.contain,
                      height: 188,
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '정말 삭제 하실 건가요?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Adjust the alignment as needed
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle button press, navigate to GardenMain page, for example
  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: Size(
                      screenWidth *
                          0.42, // Adjust the width of the first button
                      screenHeight * 0.053,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    '취소',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press for the second button
                    // Add your logic or navigation here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: Size(
                      screenWidth *
                          0.42, // Adjust the width of the second button
                      screenHeight * 0.053,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    '삭제',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
