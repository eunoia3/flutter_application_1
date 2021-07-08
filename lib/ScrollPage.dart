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
    {"index": 23, "image": "assets/images/img_mix.png", "name": "믹스스"}
  ]
};
BearList? bearList;

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  late ScrollController _scrollController;
  final globalKeys = <GlobalKey>[];
  final _sectionList = <dynamic, GlobalKey>{};

  @override
  void initState() {
    _scrollController = new ScrollController();
    bearList = BearList.fromJson(bearItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var list = bearList!.list;

    print(' --- TV_GROUP_DATE_T1 >> build() - list : ${list!.length}');
    for (var i = 0; i < list.length; i++) {
      if (i == 0) {
        globalKeys.clear();
      }
      globalKeys.add(GlobalKey());
      _sectionList[list[i].index] = globalKeys[i];
    }

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ScrollPage'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // WidgetsBinding.instance!.addPostFrameCallback(
            //   (timeStamp) {
            //     _scrollController.animateTo(
            //         _scrollController.position.maxScrollExtent,
            //         duration: Duration(milliseconds: 200),
            //         curve: Curves.easeInOut);
            //   },
            // );
            print(' --- globalKeys.length : ${globalKeys.length}');
            Scrollable.ensureVisible(
              _sectionList[22]!.currentContext!,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          },
          child: Icon(Icons.add),
        ),
        body: generateList2(),

        // generateList(),
      ),
    );
  }

  Widget generateList() {
    ListView myList = new ListView.builder(
      itemCount: bearList!.list!.length,
      itemBuilder: (context, index) {
        return new SingleChildScrollView(
          child: ScrollWidgetPage(
            index: index,
            itemKey: _sectionList[index]!,
          ),
        );
      },
    );
    return myList;
  }

  Widget generateList2() {
    //자동 스크롤되게 하기
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Scrollable.ensureVisible(
        _sectionList[22]!.currentContext!,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });

    List<Widget> scrollListWidget = bearList!.list!.map((e) {
      return ScrollWidgetPage(
        index: e.index!,
        itemKey: _sectionList[e.index!]!,
      );
    }).toList();
    return SingleChildScrollView(
      child: Column(
        children: scrollListWidget,
      ),
    );
  }
}
