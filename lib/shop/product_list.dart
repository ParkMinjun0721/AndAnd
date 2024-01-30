import 'package:flutter/material.dart';

import '../widget/baseappbar.dart';
import '../widget/bottomNavi.dart';
import 'product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingUI(),
    );
  }
}

class ShoppingUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 44.0; // 크기를 조절할 높이

    return Scaffold(
      appBar: BaseAppBar(), // baseappbar.dart에서 가져온 AppBar 위젯을 사용합니다.
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '쇼핑하기', // 좌측 상단 "쇼핑하기" 텍스트
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // 옅은 회색 배경색상
                      borderRadius: BorderRadius.circular(10.0), // 박스의 꼭짓점을 둥글게 만듭니다.
                    ),
                    child: Text(
                      'P 3,000', // 옅은 회색 박스 안에 표시될 텍스트
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  List<String> productInfo = [
                    '롯데 몽쉘 오리지널 12개입',
                    'GS25 5,000원 상품권',
                    'CU 5,000원 상품권',
                    'GS25 비타500',
                  ];
                  List<String> productPrice = ['5,400원', '5,000원', '5,000원', '1,200원'];

                  return GestureDetector(
                    onTap: () {
                      // 'ProductDetail' 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            product: productInfo[index], // 상품명을 전달
                            image: 'https://via.placeholder.com/300', // 이미지 URL 추가
                            price: productPrice[index],
                            description: '상품 설명을 여기에 추가하세요.', // 상품 설명 추가
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2.0,
                      child: Stack(
                        alignment: Alignment.center, // 이미지를 중앙으로 정렬하기 위해 추가
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Image.network(
                                    'https://via.placeholder.com/150',
                                    fit: BoxFit.contain, // 이미지를 화면에 가득 차게 하고 중앙 정렬
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    productInfo[index],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                                  child: Text(
                                    productPrice[index],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 8.0,
                            bottom: 8.0,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(
        selectedIndex: 2,
        onItemTapped: (index) {
          print('Selected Index: $index');
        },
      ), // bottomNavi.dart에서 가져온 BottomNavigationBar 위젯을 사용합니다.
    );
  }
}
