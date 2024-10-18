import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터 (책임 : 데이터)
class NumModel { // (class Model - extends Model 과 같음)
  int num = 1;
}

// 창고 (책임 : 비즈니스 로직 관리)
class NumStore extends NumModel { // NumStore 가 창고데이터를 has 하고있다.(mixin - with)

  void increase() {
    super.num++;
  }

  void decrease() {
    super.num--;
  }
}

// 창고 관리자 (책임 : 창고관리)
final numProvider = StateProvider<NumStore>((ref) { // Provider 가 창고를 관리한다.
  print("StateProvider 창고 생성됨");
  return NumStore();
});
