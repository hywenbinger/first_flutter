import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final List<String> _list;

  MyListView(this._list);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(
          _list[index],
        );
      },
      itemCount: _list.length,
    );
  }
}
