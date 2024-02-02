import 'package:andand/shop/purchase_history.dart';
import 'package:flutter/material.dart';
import '../widget/baseappbar.dart';
import '../widget/bottomNavi.dart';

class PurchaseComplete extends StatelessWidget {
  final String productName;
  final String productPrice;

  PurchaseComplete({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/marketComplete.png',
                    fit: BoxFit.contain,
                    height: 188,
                  ),
                  SizedBox(height: 40),
                  Text(
                    '구매 완료!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '등록된 전화번호로 보내 드릴게요!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 'PurchaseHistory' 페이지로 이동하면서 상품명과 가격 전달
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseHistory(
                          productName: productName,  // 상품명 전달
                          productPrice: productPrice,   // 가격 전달
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF87BD9D), // '87BD9D' 색상
                    minimumSize: Size(300, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
