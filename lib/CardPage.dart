import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('CardPage'),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4.0, //그림자 깊이
          child: Container(
            height: 200,
            width: 200,
            // child: ClipRRect(
            // borderRadius: BorderRadius.circular(16.0),
            // child: Image.asset(
            //   'assets/images/img_yellow.png',
            //   fit: BoxFit.fill,
            // ),
            // ),
            child: Icon(
              Icons.face,
              color: Colors.grey,
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
