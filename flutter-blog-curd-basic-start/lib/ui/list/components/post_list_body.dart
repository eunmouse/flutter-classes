import 'package:blog/ui/detail/post_detail_page.dart';
import 'package:blog/ui/list/post_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListBody extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. ViewModel 이 만들어져야함 watch 로 보기
    PostListModel? model = ref.watch(postListProvider); // null 일 수 있으니 ? 넣기, 귀찮으면 var 할 수 있음, 하지만 초보자들은 명확한 타입을 넣어야 한다.

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${model.posts[index].id}"),
                title: Text("${model.posts[index].title}"),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(),));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: model.posts.length),
      );
    }
  }
}
