import 'package:flutter/material.dart';
import '../login/login_main.dart';
import '../util/color.dart';
import '../widget/lightappbar.dart';
import 'gardenmain.dart';

class GardenComplete extends StatefulWidget {
  const GardenComplete({super.key});

  @override
  State<GardenComplete> createState() => _GardenCompleteState();
}

class _GardenCompleteState extends State<GardenComplete> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Assuming lightColorScheme is an instance of your light theme
    Color primaryColor = lightColorScheme.primary;

    return Scaffold(
      backgroundColor: LoginPage.backgroundMain,
      appBar: const LightAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/garden_complete.png',
                    fit: BoxFit.contain,
                    height: 188,
                  ),
                  const SizedBox(height: 40),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '추가 성공!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '새로운 꽃이 피었어요!',
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
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle button press, navigate to GardenMain page, for example
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GardenMain()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryColor, // Set the button color to the primary color
                    minimumSize: Size(
                        screenWidth * 0.8,
                        screenHeight *
                            0.063), // Set the width as a percentage of the screen width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the value to change the corner radius
                    ),
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set the text color to white
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
