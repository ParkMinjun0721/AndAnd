import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Column(
        children: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: _checkQuestion,
          ),
          Center(
            child: Text(
              'Your Body Content',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          SizedBox(
            height: 20.0, // Adjust the spacing as needed
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkPlus,
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GradenMain(),
  ));
}
