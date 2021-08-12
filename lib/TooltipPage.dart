import 'package:flutter/material.dart';

class TooltipPage extends StatefulWidget {
  const TooltipPage({Key? key}) : super(key: key);

  @override
  _TooltipPageState createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TooltipPage'),
      ),
      body: Container(
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
                message: 'TooltipPage 의 시작 화면입니다.',
                child: Icon(
                  Icons.info,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
