import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformPage extends StatelessWidget {
  const PlatformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform;
    if (kIsWeb) {
      platform = 'Web';
    } else if (Platform.isAndroid) {
      platform = 'Android';
    } else if (Platform.isIOS) {
      platform = 'IOS';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 70,
                // color: Colors.yellow[200],
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  color: Colors.yellow[200],
                ),
                child: Text('My Platform : $platform'),
              ),
              Container(
                height: 70,
                // color: Colors.yellow[200],
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  color: Colors.yellow[200],
                ),
                child: Text('My Platform : $platform'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
