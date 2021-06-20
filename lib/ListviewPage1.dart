import 'package:flutter/material.dart';

class ListviewPage1 extends StatefulWidget {
  const ListviewPage1({
    Key? key,
  }) : super(key: key);

  @override
  _ListviewPage1State createState() => _ListviewPage1State();
}

class _ListviewPage1State extends State<ListviewPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListviewPage'),
      ),
      body: ListView.builder(
          scrollDirection:
              Axis.vertical, //vertical : 수직으로 나열 / horizontal : 수평으로 나열
          itemCount: 7, //리스트의 개수
          itemBuilder: (BuildContext context, int index) {
            //리스트의 반목문 항목 형성
            return Container(
              height: 70,
              color: Colors.green[index * 100],
              alignment: Alignment.center,
              child: Text('item : $index'),
            );
          }),
    );
  }
}
