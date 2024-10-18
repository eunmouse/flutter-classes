import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        cursorColor: Colors.grey,
        // decoration: InputDecoration 객체 (테두리, 레이블, 아이콘 및 스타일 설정)
        decoration: InputDecoration(
          disabledBorder: _buildOutLineInputBorder(),
          // 비활성화 시 테두리
          enabledBorder: _buildOutLineInputBorder(),
          // 활성화 시 테두리
          focusedBorder: _buildOutLineInputBorder(),
          // 포커스 시 테두리
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          contentPadding:
              const EdgeInsets.only(left: 0, bottom: 15, top: 15, right: 0),
          hintText: '좌동 주변 가게를 찾아 보세요.',
          hintStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutLineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
        borderRadius: BorderRadius.circular(8.0));
  }
}
