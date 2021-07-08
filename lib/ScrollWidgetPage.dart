import 'package:flutter/material.dart';

class ScrollWidgetPage extends StatefulWidget {
  final int index;
  final GlobalKey itemKey;

  const ScrollWidgetPage({
    Key? key,
    required this.index,
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
        color: Colors.pink[widget.index * 100],
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
            // Image.asset(
            //   bearList!.list!.elementAt(index).image!,
            // ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'item : ${widget.index}',
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
