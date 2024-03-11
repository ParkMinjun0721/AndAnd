import 'package:flutter/material.dart';
import 'package:andand/widget/bottomNavi.dart';
import 'package:andand/util/color.dart';
import 'package:andand/garden/flowerbook.dart';

import 'gardeninput.dart';

void main() {
  runApp(const MaterialApp(
    home: GardenMain(),
  ));
}

class GardenMain extends StatefulWidget {
  const GardenMain({Key? key}) : super(key: key);

  @override
  _GardenMainState createState() => _GardenMainState();
}

class _GardenMainState extends State<GardenMain> {
  void _checkPlus() {
    setState(() {
        Navigator.of(context).pop(); // Close the openBook dialog
        // Navigate to the FlowerBook page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GardenInput(),
          ),
        );
    });
  }

  void _checkQuestion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("사용방법")),
          content: const Text("1. + 버튼을 클릭해 꽃,풀,산과 같은 자연을 촬영 또는 업로드해주세요!\n\n"
              "2. 꽃 사진을 추가하면 정원이 레벨 업을 해서 더욱 예쁘게 꾸며져요\n\n"
              "3. 추가된 꽃은 공유되고, 함께 도감에서 볼 수 있어요!\n\n"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("닫기"),
            ),
          ],
        );
      },
    );
  }

  void _showEnlargedBook() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              Image.asset(
                'assets/openBook.png',
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left: MediaQuery.of(context).size.width * 0.42,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close the openBook dialog
                    // Navigate to the FlowerBook page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlowerBook(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/question.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  final String name1 = '안하경';
  final String name2 = '도현미';
  final int level = 1;

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth / 20;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight + statusBarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '$name1 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: '님과 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '$name2 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: '님의 정원',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/garden$level.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              right: MediaQuery.of(context).size.width * 0.05,
              child: IconButton(
                icon: const Icon(Icons.info_outlined),
                onPressed: _checkQuestion,
              ),
            ),
            Positioned(
              top: 20.0,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Text(
                'level $level',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: MediaQuery.of(context).size.width * 0.05,
              child: GestureDetector(
                onTap: _showEnlargedBook,
                child: Image.asset(
                  'assets/flowerbook.png',
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
            Positioned(
              bottom: 30.0,
              left: MediaQuery.of(context).size.width * 0.05,
              child: FloatingActionButton(
                onPressed: _checkPlus,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: lightColorScheme.primary, // Modify the color if needed
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(
        selectedIndex: 0,
        onItemTapped: (index) {
          print('Selected Index: $index');
        },
      ),
    );
  }
}
