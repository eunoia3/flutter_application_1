import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OverlayPage extends StatefulWidget {
  const OverlayPage({Key? key}) : super(key: key);

  @override
  _OverlayPageState createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OverlayPage'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 70,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('Tooltip '),
                ),
                Container(
                  child: MyTooltip(
                    message: 'Tooltip 을 이용하여 띄웠습니다. ',
                    child: Icon(
                      Icons.info,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: addOverlay,
            child: Text('show overlay tooltip'),
          ),
        ],
      ),
    );
  }

  final overlays = <OverlayEntry>[];

  void addOverlay() {
    overlays.add(overlayEntry);
    Overlay.of(context)!.insert(overlays.last);
  }

  void removeOverlay() {
    if (overlays.isNotEmpty) overlays.removeLast().remove();
  }

  void onTapOverlay() {}

  OverlayEntry get overlayEntry {
    final screen = MediaQuery.of(context).size;
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 48,
          top: (screen.height.toInt() ~/ 3).toDouble(),
          child: Material(
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: ShapeDecoration(
                  shape: TooltipShapeBorder(
                    arrowArc: 0.3,
                  ),
                  color: Colors.purpleAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Overlay 을 이용하여 띄웠습니다. ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        removeOverlay();
                      },
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//Tooltip 위젯을 이용하여 띄우기
class MyTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  MyTooltip({
    required this.message,
    required this.child,
  });
  @override
  _MyTooltipState createState() => _MyTooltipState();
}

class _MyTooltipState extends State<MyTooltip> {
  final key = GlobalKey<State<Tooltip>>();
  bool toolTipVisibility = false;

  @override
  void initState() {
    super.initState();
    toolTipVisibility = true;
  }

  @override
  Widget build(BuildContext context) {
    return TooltipTheme(
      data: TooltipThemeData(
        decoration: ShapeDecoration(
          shape: TooltipShapeBorder(
            arrowArc: 0.3,
          ),
          color: Colors.redAccent[200],
        ),
      ),
      child: Container(
        child: Tooltip(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 12,
            right: 12,
          ),
          verticalOffset: 20,
          margin: EdgeInsets.only(
            left: 56,
          ),
          key: key,
          message: widget.message,
          child: InkWell(
            onTap: () => _onTap(key),
            child: Container(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    if (toolTipVisibility) {
      tooltip?.ensureTooltipVisible();
      toolTipVisibility = false;
    } else {
      tooltip?.deactivate();
      toolTipVisibility = true;
    }
  }
}

//Tooltip 물풍선 모양 ShapeBorder 만들기
class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  TooltipShapeBorder({
    this.radius = 8,
    this.arrowWidth = 15,
    this.arrowHeight = 10,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(
        rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    var x = arrowWidth;
    var y = arrowHeight;
    var r = 1 - arrowArc;
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect,
          Radius.circular(radius),
        ),
      )
      ..moveTo(16 + rect.topLeft.dx + (x / 2), rect.topCenter.dy - y)
      ..lineTo(16 + rect.topLeft.dx, rect.topCenter.dy)
      ..lineTo(16 + rect.topLeft.dx + x, rect.topCenter.dy);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
}
