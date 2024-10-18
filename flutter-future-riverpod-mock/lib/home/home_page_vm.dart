import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeapp/home_repository.dart';

// 뷰 모델 (창고)
class HomeVM extends StateNotifier<int?> {
  HomeVM(super.state);

  // selectAll

  // selectOne

  // join

  // login

  // logout (통신 안필요, JWT 만 삭제하면 됨)

  Future<void> notifyInit() async {
    int num = await HomeRepository().fetchNumber(); // 3초
    state = num;
  }
}

// 뷰 모델 관리하는 관리자 (창고 관리자)
// watch하거나, read할때 실행됨 (View에서 실행시킴)
final homeProvider = StateNotifierProvider<HomeVM, int?>((ref) { // <창고, 창고데이터 타입>
  HomeVM vm = HomeVM(null);
  vm.notifyInit();
  return vm;
});
