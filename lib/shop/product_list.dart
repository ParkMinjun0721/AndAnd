import 'package:flutter/material.dart';
import '../widget/baseappbar.dart';
import '../widget/bottomNavi.dart';
import 'product_detail.dart';
import 'purchase_history.dart';

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

class ShoppingUI extends StatefulWidget {
  @override
  _ShoppingUIState createState() => _ShoppingUIState();
}

class _ShoppingUIState extends State<ShoppingUI> {
  final TextEditingController searchController = TextEditingController();
  List<String> productInfo = [
    '롯데 몽쉘 오리지널 12봉입',
    'GS25 5,000원 상품권',
    'CU 5,000원 모바일 상품권',
    'GS25 비타500',
    '스타벅스 아메리카노 Tall',
    'CU 하늘보리 500ml',
    'CU 바나나맛우유 240ml',
    '배스킨라빈스 싱글킹',
    'CGV 2D 영화관람권 1매',
    '이디야커피 카페라떼 ICED',
  ];

  List<String> productPrice = [
    '5,400원',
    '5,000원',
    '5,000원',
    '1,200원',
    '4,500원',
    '1,800원',
    '1,800원',
    '4,700원',
    '13,000원',
    '4,200원'
  ];
  List<bool> showProduct = [true, true, true, true, true, true, true, true, true, true];

  void filterProducts(String searchTerm) {
    setState(() {
      for (int i = 0; i < productInfo.length; i++) {
        String product = productInfo[i].toLowerCase();
        showProduct[i] = product.contains(searchTerm.toLowerCase());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 56.0;

    return Scaffold(
      appBar: BaseAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '쇼핑하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 16.0),
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'P 3,000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: buttonHeight,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '상품 검색하기',
                              prefixIcon: Icon(Icons.search),
                            ),
                            onChanged: (value) {
                              filterProducts(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Container(
                  height: buttonHeight,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchaseHistory(
                            productName: '구매한 상품명',
                            productPrice: '구매한 상품 가격',
                          ),
                        ),
                      );
                    },
                    child: Text('구매\n목록'),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  '\n 포인트로 아이템을 구매하면 등록된 전화번호로 기프티콘을 전송해드립니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
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
                itemCount: productInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return showProduct[index]
                      ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            product: productInfo[index],
                            image: 'assets/shop_gift${index + 1}.png',
                            price: productPrice[index],
                            description: '상품 설명을 여기에 추가하세요.',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2.0,
                      child: Padding( // Padding 추가
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0), // 가로 여백은 12.0, 세로 여백은 4.0으로 수정
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.network(
                              'assets/shop_gift${index + 1}.png',
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 8.0), // 이미지와 나머지 사항 사이에 간격 추가
                            Text(
                              productInfo[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0), // 상품명과 가격 사이에 간격 추가
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productPrice[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      : Container();
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
      ),
    );
  }
}
