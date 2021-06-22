import 'package:flutter/material.dart';

class OrientationPage extends StatefulWidget {
  const OrientationPage({Key? key}) : super(key: key);

  @override
  _OrientationPageState createState() => _OrientationPageState();
}

class _OrientationPageState extends State<OrientationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationPage'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(30, (index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                  color: Colors.redAccent,
                )),
                child: Text('item : $index'),
              );
            }),
          );
        },
      ),
    );
  }
}
