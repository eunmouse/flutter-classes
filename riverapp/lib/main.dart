import 'package:flutter/material.dart';
import 'package:riverapp/num_notify_provider.dart';
import 'package:riverapp/num_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("HomePage");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Top(),
          ),
          Expanded(
            child: Bottom(),
          ),
        ],
      ),
    );
  }
}

class Bottom extends ConsumerWidget { // 값을 변경하고 싶으면 ConsumerWidget 로 바꾼다

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Bottom");

    // NumStore store = ref.read(numProvider);

    BunStore store = ref.read(bunProvider.notifier); // 창고에 접근

    return Center(
      child: Container(
        child: InkWell(
          onTap: () {
            print("증가 클릭됨");
            store.increase(); // 상태 변경시키는 것
            },
          child: Text(
            "증가",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class Top extends ConsumerWidget { // (문법) DI 코드, 사용하는 곳에서

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Top");
    // 우변에서 일어나는 일
    // NumStore store = ref.read(numProvider); // 프로바이더의 익명함수가 실행됨 (창고접근)
    // store.increase(); // 증가시키고 싶으면

    BunModel model = ref.watch(bunProvider); // 프로바이더의 익명함수가 실행됨 (모델접근)

    return Center(
      child: Container(
        child: Text("${model.bun}", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}