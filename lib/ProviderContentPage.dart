import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderCountPage.dart';
import 'ProviderFirstPage.dart';
import 'ProviderSecondPage.dart';

class ProviderContentPage extends StatelessWidget {
  const ProviderContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<int>(context); // 가까운 Provider로부터 값을 가져옵니다.
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Simple app'),
    //   ),
    //   body: Center(
    //     child: Text('${data}'), // 값이 표시됩니다 (여기서는 5)
    //   ),
    // );
    final counter = Provider.of<Counter>(context); // Counter 타입의 데이터를 가져옴.

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: () {
                openFirstPage(context);
              },
              child: Text('first page'),
            ),
            RaisedButton(
              onPressed: () {
                openSecondPage(context);
              },
              child: Text('second page'),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counter
                .increment, // 버튼을 누를 때마다, 값이 증가합니다. notifyListeners()가 호출되기에 UI가 갱신됩니다.
            tooltip: 'Increment',
            child: Icon(Icons.add),
            heroTag: null,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: counter.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            heroTag: null,
          )
        ],
      ),
    );
  }

  // 다른 페이지로 이동을 합니다. 이동한 페이지에서도 Counter의 값은 동일합니다.
  Future openFirstPage(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProviderFirstPage(),
      ),
    );
  }

  Future openSecondPage(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProviderSecondPage(),
      ),
    );
  }
}
