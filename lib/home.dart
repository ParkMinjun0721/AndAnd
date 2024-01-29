import 'package:andand/login/login_main.dart';
import 'package:flutter/material.dart';
import 'util/color.dart';
import 'widget/bottomNavi.dart';
import 'widget/baseappbar.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andand',
      theme: ThemeData(
        //primaryColor: lightColorScheme.primary,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: BaseAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: screenHeight * 0.4,
              floating: false,
              pinned: false,
              flexibleSpace: Container(
                width: screenWidth,
                height: screenHeight * 0.26,
                color: Color(0xFF87BD9D),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        '  키워드에 어울리는\n 오늘의 사진 한 장을\n      공유해주세요!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(
                            'assets/mainbear.png',
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.68,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // 그림자 색상
                          blurRadius: 5.0, // 그림자 흐림 정도
                          offset: Offset(0, 2), // 그림자 위치 (수평, 수직)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
      bottomNavigationBar: BottomNavi(
        selectedIndex: 1,
        onItemTapped: (index) {
          print('Selected Index: $index');
        },
      ),
    );
  }
}