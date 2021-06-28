import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderCountPage.dart';

class ProviderSecondPage extends StatefulWidget {
  const ProviderSecondPage({Key? key}) : super(key: key);

  @override
  _ProviderSecondPageState createState() => _ProviderSecondPageState();
}

class _ProviderSecondPageState extends State<ProviderSecondPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(
        child: Container(
          child: Text('second page counter ${counter.getCounter()}'),
        ),
      ),
    );
  }
}
