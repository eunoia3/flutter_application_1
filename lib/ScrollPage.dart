import 'package:flutter/material.dart';
import 'package:flutter_application_1/ScrollWidgetPage.dart';

import 'model/BearItem.dart';

final bearItem = {
  "list": [
    {"index": 0, "image": "assets/images/img_blue.png", "name": "파랑이"},
    {"index": 1, "image": "assets/images/img_mint.png", "name": "민트트"},
    {"index": 2, "image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"index": 3, "image": "assets/images/img_white.png", "name": "하양이"},
    {"index": 4, "image": "assets/images/img_pink.png", "name": "분홍이"},
    {"index": 5, "image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"index": 6, "image": "assets/images/img_purple.png", "name": "보라라"},
    {"index": 7, "image": "assets/images/img_mix.png", "name": "믹스스"},
    {"index": 8, "image": "assets/images/img_blue.png", "name": "파랑이"},
    {"index": 9, "image": "assets/images/img_mint.png", "name": "민트트"},
    {"index": 10, "image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"index": 11, "image": "assets/images/img_white.png", "name": "하양이"},
    {"index": 12, "image": "assets/images/img_pink.png", "name": "분홍이"},
    {"index": 13, "image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"index": 14, "image": "assets/images/img_purple.png", "name": "보라라"},
    {"index": 15, "image": "assets/images/img_mix.png", "name": "믹스스"},
    {"index": 16, "image": "assets/images/img_blue.png", "name": "파랑이"},
    {"index": 17, "image": "assets/images/img_mint.png", "name": "민트트"},
    {"index": 18, "image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"index": 19, "image": "assets/images/img_white.png", "name": "하양이"},
    {"index": 20, "image": "assets/images/img_pink.png", "name": "분홍이"},
    {"index": 21, "image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"index": 22, "image": "assets/images/img_purple.png", "name": "보라라"},
    {"index": 23, "image": "assets/images/img_mix.png", "name": "믹스스"},
    {"index": 24, "image": "assets/images/img_blue.png", "name": "파랑이"},
    {"index": 25, "image": "assets/images/img_mint.png", "name": "민트트"},
    {"index": 26, "image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"index": 27, "image": "assets/images/img_white.png", "name": "하양이"},
    {"index": 28, "image": "assets/images/img_pink.png", "name": "분홍이"},
    {"index": 29, "image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"index": 30, "image": "assets/images/img_purple.png", "name": "보라라"},
    {"index": 31, "image": "assets/images/img_mix.png", "name": "믹스스"}
  ]
};
BearList? bearList;

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final _globalList = <dynamic, GlobalKey>{};

  @override
  void initState() {
    bearList = BearList.fromJson(bearItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var list = bearList!.list;

    for (var i = 0; i < list!.length; i++) {
      _globalList[list[i].index] = GlobalKey();
    }

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ScrollPage'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(' --- globalKeys.length : ${_globalList.length}');
            Scrollable.ensureVisible(
              _globalList[10]!.currentContext!,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          },
          child: Icon(Icons.check),
        ),
        body: scrollBodyList(),
      ),
    );
  }

  Widget scrollBodyList() {
    //자동 스크롤되게 하기
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Scrollable.ensureVisible(
        _globalList[22]!.currentContext!,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });

    List<Widget> scrollListWidget = bearList!.list!.map((e) {
      return ScrollWidgetPage(
        index: e.index!,
        imgUrl: e.image!,
        imgNm: e.name!,
        itemKey: _globalList[e.index!]!,
      );
    }).toList();
    return SingleChildScrollView(
      child: Column(
        children: scrollListWidget,
      ),
    );
  }
}
