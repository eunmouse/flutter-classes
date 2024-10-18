import 'package:blog/core/utils.dart';

class PostRepository {
  // 통신 후 body 데이터만 응답
  // List<dynamic> or Map<String, dynamic>
  Future<List<dynamic>> findAll() async {
    // 1. 통신 -> response [header, body]
    var response = await dio.get("/api/post"); // map 타입으로 자동 파싱 되어있음

    // 2. body 부분 리턴
    // body 부분이 json array 면 List<dynamic>으로 받기
    // body 부분이 json 이면 Map<String, dynamic>으로 받기
    List<dynamic> responseBody = response.data["body"];

    return responseBody;
  }

  Future<Map<String, dynamic>> findById(int id) async {
    // 1. 통신 -> response [header, body]
    var response = await dio.get("/api/post/$id"); // map 타입으로 자동 파싱 되어있음

    // 2. body 부분 리턴
    // body 부분이 json array 면 List<dynamic>으로 받기
    // body 부분이 json 이면 Map<String, dynamic>으로 받기
    Map<String, dynamic> responseBody = response.data["body"];

    return responseBody;
  }

  Future<Map<String, dynamic>> save(String title, String content) async {
    // 1. 통신 -> response [header, body]
    var response =
        await dio.post("/api/post", data: {"title": title, "content": content});

    // 2. body 부분 리턴
    // body 부분이 json array 면 List<dynamic>으로 받기
    // body 부분이 json 이면 Map<String, dynamic>으로 받기
    Map<String, dynamic> responseBody = response.data["body"];

    return responseBody; // { "id": 21, "title": "값" }
  }
}
