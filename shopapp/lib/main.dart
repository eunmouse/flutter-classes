import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShopPage(),
    );
  }
}

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ShopPage 그림 그려짐");
    return Scaffold(
      appBar: AppBar(title: Text("쇼핑카트")),
      body: Column(
        children: [
          // 1. 이미지
          // 2. 버튼2개
          Header(),

          // 3. 동그라미 두개
          _circle(),
          _field(),
        ],
      ),
    );
  }

  Stack _field() {
    return Stack(
      children: [
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.person),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        Positioned(
          left: 200,
          top: 50,
          child: Icon(Icons.person),
        ),
      ],
    );
  }

  Container _circle() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Align(
        alignment: Alignment(1.0, 0.0), // -1.0~1.0(가로), -1.0~1.0(세로)
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(75),
          ),
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<String> imageList = [
    "https://picsum.photos/id/100/200/200",
    "https://picsum.photos/id/101/200/200"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("Header 그림 그려짐");
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 3 / 2,
          child: Image.network(
            imageList[selectedIndex],
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  selectedIndex = 0;
                  print("selectedIndex : $selectedIndex");
                  setState(() {});
                },
                icon: Icon(Icons.account_circle_sharp),
              ),
            ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  selectedIndex = 1;
                  print("selectedIndex : $selectedIndex");
                  setState(() {});
                },
                icon: Icon(Icons.access_alarms_sharp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
