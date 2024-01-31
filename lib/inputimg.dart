import 'package:flutter/material.dart';
import 'widget/lightappbar.dart';

class InputImg extends StatefulWidget {
  const InputImg({Key? key}) : super(key: key);

  @override
  State<InputImg> createState() => _InputImgState();
}

class _InputImgState extends State<InputImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/camera.png',
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.13,
            ),

          ],
        ),
      ),
    );
  }
}
