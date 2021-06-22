import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/BearItem.dart';

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

var imageUrl =
    'https://images.pexels.com/photos/912110/pexels-photo-912110.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';

class ListviewPage extends StatefulWidget {
  ListviewPage({
    Key? key,
  }) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  @override
  Widget build(BuildContext context) {
    bearList = BearList.fromJson(bearItem);
    return new MaterialApp(
      // 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListViewPage'),
        ),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(), //separatorBuilder : item과 item 사이에 그려질 위젯 (개수는 itemCount -1 이 된다)
          itemCount: bearList!.list!.length, //리스트의 개수
          itemBuilder: (BuildContext context, int index) {
            //리스트의 반목문 항목 형성
            return Container(
              height: 80,
              color: Colors.pink[index * 100],
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    // color: Colors.yellow,
                    child: Text(
                      '$index',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Image.asset(
                    bearList!.list!.elementAt(index).image!,
                  ),
                  Expanded(
                    child: Container(
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
