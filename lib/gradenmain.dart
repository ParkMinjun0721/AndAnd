import 'package:flutter/material.dart';
import 'package:andand/widget/bottomNavi.dart';
import 'util/color.dart';

class GradenMain extends StatefulWidget {
  const GradenMain({Key? key}) : super(key: key);

  @override
  _GradenMainState createState() => _GradenMainState();
}

class _GradenMainState extends State<GradenMain> {
  bool _onClickPlus = false;
  bool _onClickQuestion = false;

  void _checkPlus() {
    setState(() {
      _onClickPlus = true;
      // '+' 버튼 누르면 다른 로 이동 또는 작업 수행
    });
  }

  void _checkQuestion() {
    setState(() {
      _onClickQuestion = true;
      // 물음표 버튼 누르면 다른 로 이동 또는 작업 수행
    });
  }

  final String name1 = '안하경';
  final String name2 = '도현미';

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
          backgroundColor: Colors.white,
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
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/graden1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: IconButton(
                icon: Icon(Icons.help_outline),
                onPressed: _checkQuestion,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkPlus,
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: lightColorScheme.primary,
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
    home: GradenMain(),
  ));
}
