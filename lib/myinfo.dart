import 'package:flutter/material.dart';
import 'package:andand/util/color.dart';
import 'package:andand/widget/bottomNavi.dart';
import 'package:flutter/services.dart';

class MyInfo extends StatefulWidget {
  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  String userName = '안하경';
  String birthday = '2002.11.08';
  String phoneNumber = '010-2000-3000';
  String ipAddress = 'avcddf88d';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: Color(0xFF87BD9D).withOpacity(0.08),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: Color(0xFF87BD9D).withOpacity(0.08),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.055,
                          backgroundImage: AssetImage('assets/your_image.png'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.013,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.045,
                              ),
                              child: Text(
                                userName,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _showEditDialog('이름', userName);
                              },
                              child: Icon(
                                Icons.edit,
                                size: MediaQuery.of(context).size.width * 0.05,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.width * 0.38,
                    child: InkWell(
                      onTap: () {
                        // Handle icon tap if needed
                      },
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.033,
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: MediaQuery.of(context).size.width * 0.045,
                          color: lightColorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.08),
                  Row(
                    children: [
                      Text(
                        '생년월일: ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showEditDialog('생년월일', birthday);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          child: Row(
                            children: [
                              Text(
                                '$birthday',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 96, 96, 96),
                                ),
                              ),
                              Icon(
                                Icons.edit,
                                size: MediaQuery.of(context).size.width * 0.045,
                                color: lightColorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.22),
                    child: Divider(
                      indent: 20.0,
                      endIndent: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  Row(
                    children: [
                      Text(
                        '전화번호: ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showEditDialog('전화번호:', birthday);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          child: Row(
                            children: [
                              Text(
                                '$phoneNumber',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 96, 96, 96),
                                ),
                              ),
                              Icon(
                                Icons.edit,
                                size: MediaQuery.of(context).size.width * 0.045,
                                color: lightColorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.22),
                    child: Divider(
                      indent: 20.0,
                      endIndent: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  Row(
                    children: [
                      Text(
                        '나의 코드: ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.085,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '$ipAddress',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 96, 96, 96),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                copyToClipboard(ipAddress);
                                _showSnackbar('복사되었습니다.');
                              },
                              child: Icon(
                                Icons
                                    .copy_all_outlined, // You can use the appropriate copy icon
                                size: MediaQuery.of(context).size.width * 0.045,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.22),
                    child: Divider(
                      indent: 20.0,
                      endIndent: 20.0,
                    ),
                  ),
                ],
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

  // 다이얼로그를 통해 정보 변경
  Future<void> _showEditDialog(String field, String currentValue) async {
    TextEditingController _editingController = TextEditingController();
    _editingController.text = currentValue;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$field 변경'),
          content: TextField(
            controller: _editingController,
            decoration: InputDecoration(hintText: "새로운 $field을 입력하세요"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (field == '이름') {
                    userName = _editingController.text;
                  } else if (field == '생년월일') {
                    birthday = _editingController.text;
                  } else if (field == '전화번호') {
                    phoneNumber = _editingController.text;
                  } else if (field == '나의 IP 주소') {
                    ipAddress = _editingController.text;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void _showSnackbar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2), // You can adjust the duration as needed
    ),
  );
}

}
