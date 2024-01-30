import 'package:flutter/material.dart';
import 'package:andand/widget/bottomNavi.dart';
import '../util/color.dart';
import 'flowerbook.dart';

class GardenMain extends StatefulWidget {
  const GardenMain({Key? key}) : super(key: key);

  @override
  _GardenMainState createState() => _GardenMainState();
}

class _GardenMainState extends State<GardenMain> {

  void _checkPlus() {
    setState(() {
      // '+' 버튼 누르면 다른 로 이동 또는 작업 수행
    });
  }

  void _checkBook(){
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => flowerbook()),
      );
    });
  }

  void _checkQuestion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Center(child : Text("사용방법")),
          content: Text("1. + 버튼을 클릭해 꽃,풀,산과 같은 자연을 촬영 또는 업로드해주세요!\n\n"
              "2. 꽃 사진을 추가하면 정원이 레벨 업을 해서 더욱 예쁘게 꾸며져요\n\n"
          "3. 추가된 꽃은 공유되고, 함께 도감에서 볼 수 있어요!\n\n"),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("닫기"),
            ),
          ],
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

    // 화면의 가로 폭에 따라 텍스트 크기 동적 조절
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth / 20; // 적절한 비율로 조절

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight + statusBarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent, // 색깔 없음
          elevation: 0, // 그림자 없음
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style.copyWith(
                    fontSize: textSize, // 동적으로 조절된 텍스트 크기
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$name1',
                      style: TextStyle(
                        color: lightColorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: '님과 ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '$name2',
                      style: TextStyle(
                        color: lightColorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: '님의 정원',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),  // 왼쪽 상단 모서리 둥글게
                topRight: Radius.circular(30.0), // 오른쪽 상단 모서리 둥글게
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
                icon: Icon(Icons.info_outlined),
                onPressed: _checkQuestion,
              ),
            ),
            Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width * 0.05 ,
                child: Text(
                    'level $level',
                    style: TextStyle(
                    fontSize: screenWidth*0.05, // 원하는 폰트 크기로 조절
                    color: Colors.white, // 하얀색으로 지정
                  ),
                ),
            ),
            Positioned(
              bottom: 20.0,
              right: MediaQuery.of(context).size.width * 0.05,
              child: GestureDetector(
                onTap: _checkBook,
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
                child: Icon(Icons.add),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: lightColorScheme.primary,
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

void main() {
  runApp(MaterialApp(
    home: GardenMain(),
  ));
}
