import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Sample.dart';

class SampleBodyPage extends StatelessWidget {
  const SampleBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var val = Provider.of<Sample>(context);
    // var val2 = Provider.of<String>(context);
    return Column(
      children: [
        Text('${val.getName()}'),
        // Text('$val2'),
      ],
    );
  }
}
