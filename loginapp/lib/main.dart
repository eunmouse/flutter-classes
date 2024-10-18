import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage()
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();

  final GlobalKey _widgetKey = GlobalKey(); // 위젯 키 추가

  final FocusNode usernameFocusNode = FocusNode(); // 포커스 노드 추가
  final FocusNode passwordFocusNode = FocusNode(); // 포커스 노드 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 500,
            color: Colors.yellow,
          ),
          TextFormField(
            focusNode: usernameFocusNode, // 포커스 노드 설정
            onTap: () {
              _onTap(usernameFocusNode); // 포커스 받을 때 스크롤 처리
            },
            controller: username,
            decoration: InputDecoration(
              hintText: "Username",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextFormField(
            focusNode: passwordFocusNode,
            // 포커스 노드 설정
            onTap: () {
              _onTap(passwordFocusNode); // 포커스 받을 때 스크롤 처리
            },
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.password),
            ),
          ),
          ElevatedButton(
            key: _widgetKey, // key 설정
            onPressed: () {
              // 1. 값 가져오기
              String un = username.text;
              String pw = password.text;
              print(un);
              print(pw);
              // 2. 통신하기

              // 3. 화면 이동 (A->B)
              // [A,B] pushName
              // [B] pushReplaceName
              // [B] pushNamedAndRemoveUntil
              Navigator.pushNamed(context, "/home");
            },
            child: Text("로그인"),
          ),
        ],
      ),
    );
  }

  void _onTap(FocusNode focusNode) {
    // 키보드가 올라온 후 자동으로 스크롤
    focusNode.requestFocus(); // 포커스 요청

    // TextFormField 를 클릭했을 때,
    // Scrollable.ensureVisible 이 호출
    // _widgetKey 는 특정 위젯의 위치를 참조하기 위해 사용
    // WidgetsBinding.instance.addPostFrameCallback((_) : 키보드가 올라온 후에 UI 가 완전히 업데이트 된 시점에서 스크롤 처리를 하도록 보장해줌
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        _widgetKey.currentContext!,
        // 특정 위젯이 보이지 않으면 자동으로 스크롤 실행하여 화면에 보이도록
        duration: Duration(milliseconds: 300),
        // 스크롤 애니메이션 지속시간, 300 밀리초동안 스크롤이 부드럽게 이동
        curve: Curves.easeInOut,
        // 부드럽게 시작하고 끝나는 애니메이션 효과
        alignment: 0, // 스크롤 후 위젯이 화면에 나타나는 위치 설정
      );
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Navigator.pushNamed(context, "/login"); // [A, B, A]
            //Navigator.pushReplacementNamed(context, "/login");  // [A,A]
            //Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => true); // [A]
            Navigator.pop(context); // [A]
          },
          child: Text("뒤로가기"),
        ),
      ),
    );
  }
}
