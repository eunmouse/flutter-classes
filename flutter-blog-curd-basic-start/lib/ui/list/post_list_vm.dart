import 'package:blog/core/utils.dart';
import 'package:blog/data/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 (ViewModel)
// 통신을 할거니까
class PostListVM extends StateNotifier<PostListModel?> {
  final mContext = navigatorKey.currentState!.context;

  PostListVM(super.state);

  // 트랜잭션
  Future<void> notifySave(String title, String content) async {
    Map<String, dynamic> one = await PostRepository().save(title, content);
    _Post newPost = _Post.fromMap(one);
    PostListModel model = state!;

    List<_Post> newPosts = [newPost, ...model.posts]; // 깊은 복사

    // 상태는 새로 객체를 만들어서 줘야 한다.
    state = PostListModel(newPosts);

    Navigator.pop(mContext);
  }

  // 스프링에서 service 같은 부분, 여기서 비즈니스 로직을 처리해준다.
  Future<void> notifyInit() async {
    // 1. 통신을 해서 응답 받기
    // 단건이면 Map<String, dynamic> 로 받는다.
    // dynamic 은 Map 타입으로 다운캐스팅해서 써야 함
    List<dynamic> list = await PostRepository().findAll();

    // 2. 파싱
    List<_Post> posts = list.map((e) => _Post.fromMap(e)).toList();

    // 3. 상태 갱신
    state = PostListModel(posts); // 깊은 복사 (기존 데이털르 건드리지 않는다)
  }
}

// 2. 창고 데이터 (State)
class PostListModel {
  List<_Post> posts;

  PostListModel(this.posts);
}

class _Post {
  // 여기서만 쓸거니까, 다른 파일에서 쓸 때는 id, title 뿐만 아니라 더 있을 수도 있으니
  int id;
  String title;

  _Post.fromMap(map)
      : this.id = map["id"],
        this.title = map["title"];
}

// 3. 창고 관리자 (Provider)
final postListProvider =
    StateNotifierProvider<PostListVM, PostListModel?>((ref) {
  return PostListVM(null)..notifyInit();
});
