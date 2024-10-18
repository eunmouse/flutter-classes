import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 (ViewModel)
// 통신을 할거니까
class PostDetailVM extends StateNotifier<PostDetailModel?>{
  PostDetailVM(super.state);
}

// 2. 창고 데이터 (State)
class PostDetailModel {

}


// 3. 창고 관리자 (Provider)                       // <창고, 상태데이터 타입> 일단 null 붙이고 상태 들어오면 상태데이터 갱신시켜 줄거라서 ? 붙음
final postDetailProvider = StateNotifierProvider<PostDetailVM, PostDetailModel?>((ref) {
  return PostDetailVM(null);
});