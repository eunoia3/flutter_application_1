import 'package:flutter/material.dart';

class ScrollWidgetPage extends StatefulWidget {
  final int index;
  final String imgUrl;
  final String imgNm;
  final GlobalKey itemKey;

  const ScrollWidgetPage({
    Key? key,
    required this.index,
    required this.imgUrl,
    required this.imgNm,
    required this.itemKey,
  }) : super(key: key);

  @override
  _ScrollWidgetPageState createState() => _ScrollWidgetPageState();
}

class _ScrollWidgetPageState extends State<ScrollWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(' --- itemKey : ${widget.itemKey}');
      },
      child: Container(
        key: widget.itemKey,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.pink[widget.index * 100],
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                '${widget.index}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Image.asset(
              widget.imgUrl,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.imgNm,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
