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

class GridviewPage extends StatefulWidget {
  const GridviewPage({Key? key}) : super(key: key);

  @override
  _GridviewPageState createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  @override
  Widget build(BuildContext context) {
    bearList = BearList.fromJson(bearItem);

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridviewPage'),
        ),
        // body: GridView.count(
        //   crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
        //   childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
        //   mainAxisSpacing: 10, //수평 Padding
        //   crossAxisSpacing: 10, //수직 Padding
        //   children: List.generate(
        //     11,
        //     (index) {
        //       return Container(
        //         color: Colors.lightGreen,
        //         child: Text(' Item : $index'),
        //       );
        //     },
        //   ),
        // ),
        body: GridView.builder(
          itemCount: bearList!.list!.length, //item 개수
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
            mainAxisSpacing: 10, //수평 Padding
            crossAxisSpacing: 10, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            //item 의 반목문 항목 형성
            return Container(
              child: Column(
                children: [
                  Image.asset(
                    bearList!.list!.elementAt(index).image!,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.yellow,
                    child: Text(
                      '$index',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.lightGreenAccent,
                      alignment: Alignment.center,
                      child: Text(
                        bearList!.list!.elementAt(index).name!,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
