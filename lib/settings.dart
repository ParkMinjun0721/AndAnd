import 'package:andand/widget/bottomNavi.dart';
import 'package:flutter/material.dart';
import 'package:andand/util/color.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool yourToggleValue = false; // Toggle 버튼의 상태값을 저장하는 변수

  // 연결 끊기 동작을 수행하는 함수
  void _disconnect() {
    // 연결 끊기 동작을 추가하세요.
    // 예를 들면, 데이터 초기화, 서버 연결 종료 등의 작업을 수행할 수 있습니다.
    // 이 함수는 팝업에서 '확인'을 선택한 경우에 호출됩니다.
    print('연결이 끊어졌습니다.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '설정',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFF87BD9D).withOpacity(0.08), // AppBar 배경 색상 지정
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      0.04), // 왼쪽에 8.0의 패딩 추가
              child: Text(
                '문의하기',
                style: TextStyle(fontSize: 21),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      0.04), // 왼쪽에 8.0의 패딩 추가
              child: Text(
                'hakyoung8461@handong.ac.kr로 문의 부탁 드립니다.',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 138, 136, 136),
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.width *
                    0.035), // 각 Divider 사이에 간격을 조절하기 위한 SizedBox 추가
            Divider(
              color:
                  const Color.fromARGB(255, 200, 200, 200), // 첫 번째 Divider의 색상
              thickness: 2, // 두께
              height: 20, // 세로 간격
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.035),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('연결 끊기'),
                      content: Text('정말로 연결을 끊으시겠습니까?\n연결을 끊으시면 모든 데이터가 삭제됩니다.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('취소'),
                        ),
                        TextButton(
                          onPressed: () {
                            _disconnect();
                            Navigator.of(context).pop();
                          },
                          child: Text('확인'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04),
                child: Text(
                  '상대방과 연결 끊기',
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      0.04), // 왼쪽에 8.0의 패딩 추가
              child: Text(
                '연결을 끊으시면 이전 데이터가 전부 사라집니다',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 138, 136, 136),
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.width *
                    0.035), // 각 Divider 사이에 간격을 조절하기 위한 SizedBox 추가
            Divider(
              color:
                  const Color.fromARGB(255, 200, 200, 200), // 두 번째 Divider의 색상
              thickness: 2,
              height: 20,
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.025),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // 수평 방향에서 양쪽 끝에 정렬
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Text(
                    '알림 켜기',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Switch(
                    value: yourToggleValue,
                    onChanged: (bool value) {
                      setState(() {
                        yourToggleValue = value;
                      });
                    },
                    activeColor: lightColorScheme.primary, // 켜진 상태일 때의 색
                    inactiveThumbColor: Colors.grey, // 끄진 상태일 때의 색
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Text(
                '상대방이 사진을 올릴 시 알림이 갑니다.',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 138, 136, 136),
                ),
              ),
            ),

            SizedBox(
                height: MediaQuery.of(context).size.width *
                    0.035), // 각 Divider 사이에 간격을 조절하기 위한 SizedBox 추가
            Divider(
              color:
                  const Color.fromARGB(255, 200, 200, 200), // 세 번째 Divider의 색상
              thickness: 2,
              height: 20,
            ),
          ],
        ),
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
