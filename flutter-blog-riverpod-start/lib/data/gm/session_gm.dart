import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 창고겸(데이터)
class SessionGM {
  int? id;
  String? username;
  String? accessToken;
  bool isLogin;

  SessionGM({this.id, this.username, this.accessToken, this.isLogin = false});

  final mContext = navigatorKey.currentContext!;

  // 얘가 관리하는 함수 4개, user 관련 된 로직은 여기서 다 짬
  Future<void> login(String username, String password) async {
    // 1. 통신 {success: 머시기, status: 머시기, errorMessage: 머시기, response: 오브젝트(혹은 컬렉션)}
    // List 면 list, 한 건이면 one
    var (body, accessToken) = await UserRepository().login(username, password);

    Logger().d("세션 창고의 login() 메서드 실행됨 ${body}, ${accessToken}");

    // 2. 성공 or 실패 처리
    if (body["success"]) {
      Logger().d("로그인 성공");
      // one.success 가 true 이면
      // (1) SessionGM 값 변경
      this.id = body["response"]["id"];
      this.username = body["response"]["username"];
      this.accessToken = accessToken;
      this.isLogin = true;

      // (2) 휴대폰 하드 저장
      await secureStorage.write(key: "accessToken", value: accessToken);

      // (3) dio 에 토큰 세팅
      dio.options.headers["Authorization"] = accessToken;

      // (4) 화면 이동
      Navigator.pushNamed(mContext, "/post/list");
    } else {
      Logger().d("로그인 실패");
      // 밑에서 싹 올라오는거 SnackBar
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("${body["errorMessage"]}")),
      );
    }
  }

  Future<void> join() async {}

  Future<void> logout() async {
    await secureStorage.delete(key: "accessToken");
    this.id = null;
    this.username = null;
    this.accessToken = null;
    this.isLogin = false;
    Navigator.popAndPushNamed(mContext, "/login");
  }

  Future<void> autoLogin() async {
    // 1. 시큐어 스토리지에서 accessToken꺼내기
    String? accessToken = await secureStorage.read(key: "accessToken");

    if (accessToken == null) {
      Navigator.popAndPushNamed(mContext, "/login");
    } else {
      // 2. api 호출
      Map<String, dynamic> body = await UserRepository().autoLogin(accessToken);

      // 3. 세션값 갱신
      this.id = body["response"]["id"];
      this.username = body["response"]["username"];
      this.accessToken = accessToken;
      this.isLogin = true;
      // 4. 정상이면 post/list 로 이동 (pop and pushNamed) (pop and pushNamed 안하면 곰이 계속 돈다)
      Navigator.popAndPushNamed(mContext, "/post/list");
    }
  }
}

final sessionProvider = StateProvider<SessionGM>((ref) {
  return SessionGM();
});
