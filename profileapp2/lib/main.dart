import 'package:flutter/material.dart';

/// Flutter code sample for [TabBar].

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: 200,
        color: Colors.blue,
      ),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Profile"), // iOS 는 가운데 배치 됨
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 25),
              Container(
                child: _buildHeaderAvatar(),
              ),
              SizedBox(width: 25),
              Container(
                child: _buildHeaderProfile(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfo("50", "Posts"),
              _buildLine(),
              _buildInfo("10", "Likes"),
              _buildLine(),
              _buildInfo("3", "Share"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFollowButton(),
              _buildMessageButton(),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.directions_car)),
                      Tab(icon: Icon(Icons.directions_transit)),
                    ],
                  ),
                  Expanded(
                    child: buildTabBarView(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          // 스크롤 가능한 위젯이 실제로 필요한 만큼의 공간만 차지하게 함
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10, // 수직 padding
            crossAxisCount: 3, // 1개의 행에 보여줄 item 개수
            mainAxisSpacing: 10, // 수평 padding
          ),
          scrollDirection: Axis.vertical,
          itemCount: 300,
          itemBuilder: (context, index) {
            return Image.network(
                'https://picsum.photos/id/${index + 1}/200/200');
          },
        ),
        Container(color: Colors.red),
      ],
    );
  }

  InkWell _buildMessageButton() {
    return InkWell(
      onTap: () {
        print("Message 버튼 클릭됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        child: Text(
          "Message",
          style: TextStyle(color: Colors.black),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
      ),
    );
  }

  InkWell _buildFollowButton() {
    return InkWell(
      onTap: () {
        print("Follow 버튼 클릭됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        child: Text(
          "Follow",
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Container _buildLine() => Container(width: 2, height: 60, color: Colors.blue);

  Column _buildInfo(String count, String title) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }

  Column _buildHeaderProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "GetinThere",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Text(
          "프로그래머/작가/강사",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "데어 프로그래밍",
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  SizedBox _buildHeaderAvatar() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/avatar.png"),
      ),
    );
  }
}
