import 'package:flutter/material.dart';

class ListviewBasicPage extends StatefulWidget {
  const ListviewBasicPage({
    Key? key,
  }) : super(key: key);

  @override
  _ListviewBasicPageState createState() => _ListviewBasicPageState();
}

class _ListviewBasicPageState extends State<ListviewBasicPage> {
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
