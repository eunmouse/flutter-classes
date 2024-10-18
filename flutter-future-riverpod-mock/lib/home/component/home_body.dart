import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeapp/home/home_page_vm.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    int? num = ref.watch(homeProvider);

    if(num == null) { // 아직 통신이 안끝났으니까
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: Text("숫자 : $num"),
      );
    }
  }
}
