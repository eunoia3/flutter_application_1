import 'package:carousel_slider/carousel_slider.dart';
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

class CarouselSliderPage extends StatefulWidget {
  const CarouselSliderPage({Key? key}) : super(key: key);

  @override
  _CarouselSliderPageState createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  @override
  Widget build(BuildContext context) {
    bearList = BearList.fromJson(bearItem);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CarouselSliderPage',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 50,
          bottom: 50,
        ),
        padding: const EdgeInsets.only(
          top: 50,
          bottom: 50,
        ),
        color: Colors.greenAccent,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
          ),
          items: bearList!.list!.map((item) {
            return Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  //ClipRRect : 위젯 모서리 둥글게 하는 위젯
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    item.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ),
    );
  }
}
