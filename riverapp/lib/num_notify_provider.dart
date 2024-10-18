import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터 (데이터)
class BunModel {
  int bun;
  BunModel(this.bun);
}

// 창고 (비즈니스 로직관리)
class BunStore extends StateNotifier<BunModel> { // 문법
  BunStore(super.state);

  void increase() {
    BunModel model = super.state;
    model.bun++;
    super.state = BunModel(model.bun); // 기존 state 를 건드린게 아님, 깊은 복사해서 줘야 한다. new 를 새로 해줘야 한다.
  }

  void decrease() {
    BunModel model = super.state;
    model.bun--;
    super.state = BunModel(model.bun);
  }
}

// 창고 관리자 (창고 관리)
final bunProvider = StateNotifierProvider<BunStore, BunModel>((ref) {
  BunModel model = BunModel(1);
  return BunStore(model);
});