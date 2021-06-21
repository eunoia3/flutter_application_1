import 'package:flutter/material.dart';

import 'model/BearItem.dart';

final bearItem = {
  "list": [
    {"image": "assets/images/img_blue.png", "name": "파랑이"},
    {"image": "assets/images/img_mint.png", "name": "민트트"},
    {"image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"image": "assets/images/img_white.png", "name": "하양이"},
    {"image": "assets/images/img_pink.png", "name": "분홍이"},
    {"image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"image": "assets/images/img_purple.png", "name": "보라라"},
    {"image": "assets/images/img_mix.png", "name": "믹스스"}
  ]
};
BearList? bearList;

class PageviewPage extends StatefulWidget {
  const PageviewPage({Key? key}) : super(key: key);

  @override
  _PageviewPageState createState() => _PageviewPageState();
}

class _PageviewPageState extends State<PageviewPage> {
  @override
  Widget build(BuildContext context) {
    bearList = BearList.fromJson(bearItem);
    return new Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PageviewPage'),
        ),
        body: PageView.builder(
            controller: PageController(
              initialPage: bearList!.list!.length,
            ),
            itemCount: bearList!.list!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Image.asset(
                  bearList!.list!.elementAt(index).image!,
                ),
              );
            }),
      ),
    );
  }
}
