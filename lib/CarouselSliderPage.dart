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
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true, //자동재생 여부
          ),
          items: bearList!.list!.map((item) {
            return Builder(builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  //border 를 주기 위해 decoration 사용
                  border: Border.all(
                    width: 3,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  //ClipRRect : 위젯 모서리 둥글게 하기위해 사용하는 위젯
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
