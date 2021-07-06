import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ScrollWidgetPage.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  late ScrollController _scrollController;
  final globalKeys = <GlobalKey>[];

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ScrollPage'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // WidgetsBinding.instance!.addPostFrameCallback(
            //   (timeStamp) {
            //     _scrollController.animateTo(
            //         _scrollController.position.maxScrollExtent,
            //         duration: Duration(milliseconds: 200),
            //         curve: Curves.easeInOut);
            //   },
            // );
            // print(' --- currentContext 1 : ${globalKeys[100].currentContext}');

            // print(
            // ' --- currentContext size 1 : ${globalKeys[100].currentContext!.size}');
            print(' --- globalKeys.length : ${globalKeys.length}');
            // Scrollable.ensureVisible(globalKeys[10].currentContext!);
            // Scrollable.ensureVisible(
            //   globalKeys[12].currentContext!,
            //   duration: Duration(milliseconds: 600),
            //   curve: Curves.easeInOut,
            // );
          },
          child: Icon(Icons.add),
        ),
        body: generateList(), //
        // body: ListView.separated(
        //   controller: _scrollController,
        //   scrollDirection: Axis.vertical,
        //   separatorBuilder: (BuildContext context, int index) =>
        //       const Divider(),
        //   itemCount: 200,
        //   itemBuilder: (BuildContext context, int index) {
        //     globalKeys.add(GlobalKey());

        //     return ScrollWidgetPage(
        //       index: index,
        //       itemKey: globalKeys[index],
        //     );
        //   },
        // ),
      ),
    );
  }

  Widget generateList() {
    List<String> list = ['a', 'b'];

    ListView myList = new ListView.builder(
      itemCount: 200,
      itemBuilder: (context, index) {
        if (index == 0) {
          globalKeys.clear();
        }
        globalKeys.add(GlobalKey());
        return new ListTileTheme(
          child: ScrollWidgetPage(
            index: index,
            itemKey: globalKeys[index],
          ),
        );
      },
    );
    return myList;
  }
}
