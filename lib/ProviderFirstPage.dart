import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderCountPage.dart';

class ProviderFirstPage extends StatefulWidget {
  const ProviderFirstPage({Key? key}) : super(key: key);

  @override
  _ProviderFirstPageState createState() => _ProviderFirstPageState();
}

class _ProviderFirstPageState extends State<ProviderFirstPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Center(
        child: Container(
          child: Text('first page counter ${counter.getCounter()}'),
        ),
      ),
    );
  }
}
