import 'package:andand/calendar.dart';
import 'package:andand/myinfo.dart';
import 'package:andand/settings.dart';
import 'package:andand/widget/bottomNavi.dart';
import 'package:flutter/material.dart';
import 'package:andand/util/color.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF87BD9D),
      appBar: AppBar(
        backgroundColor: Color(0xFF87BD9D),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color to white
        ),
        flexibleSpace: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        ),
      ),
      body: Column(
        children: [
          // Upper Half with Custom Background Color
          Container(
            height: MediaQuery.of(context).size.height * 0.31,
            color: Color(0xFF87BD9D),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First Container with Image and Name
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        // Wrap the CircleAvatar with InkWell
                        InkWell(
                          onTap: () {
                            // Navigate to MyInfo page when the CircleAvatar is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyInfo()),
                            );
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.06,
                            backgroundImage:
                                AssetImage('assets/your_image.png'),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.08,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              // Navigate to MyInfo page when the edit icon is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyInfo()),
                              );
                            },
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.033,
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              child: Icon(
                                Icons.edit,
                                size: MediaQuery.of(context).size.width * 0.045,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    '안하경',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Add a SizedBox for spacing
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Second Container with Vertical Lines
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // First Section
                        Expanded(
                          child: Column(
                            children: [
                              // Icon for the first section
                              Icon(
                                Icons.favorite,
                                size: MediaQuery.of(context).size.width * 0.08,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8.0),
                              // Text for the first section
                              Column(
                                mainAxisSize: MainAxisSize
                                    .min, // Set the main axis size to minimum
                                children: [
                                  Text(
                                    '연속 횟수',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.025,
                                      color: Color(0xFFC1F3EF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '3일차',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Vertical Line 1
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: 1,
                          color: Color(0xFFC1F3EF),
                          margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02,
                          ),
                        ),

                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),

                        // Vertical Line 2
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: 1,
                          color: Color(0xFFC1F3EF),
                          margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02,
                          ),
                        ),

                        // Third Section
                        Expanded(
                          child: Column(
                            children: [
                              // Icon for the third section
                              Icon(
                                Icons.phone,
                                size: MediaQuery.of(context).size.width * 0.08,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8.0),
                              // Text for the third section
                              Text(
                                '부모님께\n전화하기',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.025,
                                  color: Color(0xFFC1F3EF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Lower Half with White Background
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    // Section 1
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07,
                                top: 8.0,
                              ),
                              child: CircleAvatar(
                                radius: MediaQuery.of(context).size.width * 0.06,
                                backgroundColor: Color(0xFFE8F3F1),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: MediaQuery.of(context).size.width * 0.07,
                                  color: Color(0xFF87BD9D),
                                ),
                              ),
                            ),
                            SizedBox(width: 25.0),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '코드 연결',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.05,
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

                    Divider(
                      color: Color(0xFFE8F3F1),
                      thickness: 1.0,
                      indent: 25.0,
                      endIndent: 25.0,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CalendarPage()), // Replace CalendarPage with the actual name of your calendar page
                        );
                      },
                      child: Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07,
                              ),
                              child: CircleAvatar(
                                radius: MediaQuery.of(context).size.width * 0.06,
                                backgroundColor: Color(0xFFE8F3F1),
                                child: Icon(
                                  Icons.text_snippet_outlined,
                                  size: MediaQuery.of(context).size.width * 0.07,
                                  color: Color(0xFF87BD9D),
                                ),
                              ),
                            ),
                            SizedBox(width: 25.0),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '기록 보기',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: MediaQuery.of(context).size.width *
                                          0.05,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Divider(
                      color: Color(0xFFE8F3F1),
                      thickness: 1.0,
                      indent: 25.0,
                      endIndent: 25.0,
                    ),

                    // Section 3
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: CircleAvatar(
                                radius: MediaQuery.of(context).size.width * 0.06,
                                backgroundColor: Color(0xFFE8F3F1),
                                child: Icon(
                                  Icons.settings,
                                  size: MediaQuery.of(context).size.width * 0.07,
                                  color: Color(0xFF87BD9D),
                                ),
                              ),
                            ),
                            SizedBox(width: 25.0),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.04),
                                child: Row(
                                  children: [
                                    Text(
                                      '설정 및 문의사항',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: MediaQuery.of(context).size.width *
                                          0.05,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Divider(
                      color: Color(0xFFE8F3F1),
                      thickness: 1.0,
                      indent: 25.0,
                      endIndent: 25.0,
                    ),

                    // Section 4
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07),
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: Color(0xFFE8F3F1),
                              child: Icon(
                                Icons.storefront,
                                size: MediaQuery.of(context).size.width * 0.07,
                                color: Color(0xFF87BD9D),
                              ),
                            ),
                          ),
                          SizedBox(width: 25.0),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Row(
                                children: [
                                  Text(
                                    '상점',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFFE8F3F1),
                      thickness: 1.0,
                      indent: 25.0,
                      endIndent: 25.0,
                    ),

                    // Section 5
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07),
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: Color(0xFFE8F3F1),
                              child: Icon(
                                Icons.exit_to_app,
                                size: MediaQuery.of(context).size.width * 0.07,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(width: 25.0),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Row(
                                children: [
                                  Text(
                                    '로그아웃',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavi(
        selectedIndex: 2,
        onItemTapped: (index) {
          print('Selected Index: $index');
        },
      ),
    );
  }
}
