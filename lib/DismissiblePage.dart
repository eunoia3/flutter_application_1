import 'package:flutter/material.dart';

class DismissiblePage extends StatefulWidget {
  const DismissiblePage({Key? key}) : super(key: key);

  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  var items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DismissiblePage'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return Dismissible(
              background: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                color: Colors.red,
                child: Text(
                  '삭제',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              key: Key(item.toString()),
              child: ListTile(
                title: Text('item : ${items[index]}'),
              ),
            );
          }),
    );
  }
}
