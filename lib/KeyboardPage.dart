import 'package:flutter/material.dart';

import 'flutter_keyboard_size.dart';

class KeyboardPage extends StatefulWidget {
  const KeyboardPage({
    Key? key,
  }) : super(key: key);

  @override
  _KeyboardPageState createState() => _KeyboardPageState();
}

class _KeyboardPageState extends State<KeyboardPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      smallSize: 500.0,
      child: Consumer<ScreenHeight>(
        builder: (context, _res, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('KeyboardPage'),
            ),
            body: Center(
              // child: Text('sa'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(),
                  Icon(Icons.accessibility, size: _res.isSmall ? 20.0 : 60.0),
                  Text(
                    'Keyboard open state',
                    style: TextStyle(
                      fontSize: _res.isSmall ? 18.0 : 30.0,
                    ),
                  ),
                  Text(
                    '${_res.isOpen}',
                    style: TextStyle(
                      fontSize: _res.isSmall ? 18.0 : 30.0,
                      color: _res.isOpen ? Colors.green[700] : Colors.red[800],
                      fontWeight:
                          _res.isSmall ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  Text(
                    'keyboard height is',
                    style: TextStyle(
                      fontSize: _res.isSmall ? 18.0 : 30.0,
                    ),
                  ),
                  Text(
                    '${_res.keyboardHeight}',
                    style: TextStyle(
                      fontSize: _res.isSmall ? 18.0 : 30.0,
                      color: _res.isOpen ? Colors.green[700] : Colors.red[800],
                      fontWeight:
                          _res.isSmall ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  Text(
                    'screen height is',
                    style: TextStyle(
                      fontSize: _res.isSmall ? 18.0 : 30.0,
                    ),
                  ),
                  Text(
                    '${_res.screenHeight}',
                    style: TextStyle(
                      fontSize: _res.isSmall ? 18.0 : 30.0,
                      color: _res.isOpen ? Colors.green[700] : Colors.red[800],
                      fontWeight:
                          _res.isSmall ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            // },
            // );
            // }
          );
        },
      ),
    );
  }
}
