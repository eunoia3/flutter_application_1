import 'package:flutter/material.dart';
import 'package:flutter_application_1/SampleBodyPage.dart';
import 'package:provider/provider.dart';

import 'Sample.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  late TabController tabController;
  late String val = '0';
  Sample sample = Sample('0');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(
        child: ChangeNotifierProvider<Sample>.value(
          value: sample,
          child: Column(
            children: [
              TestButton(),
              TabbarWidget(),
              SampleBodyPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class TestButton extends StatelessWidget {
  const TestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<Sample>(context, listen: false).setName('test');
      },
      child: Text('test'),
    );
  }
}

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({Key? key}) : super(key: key);

  @override
  _TabbarWidgetState createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    tabController.addListener(() {
      Provider.of<Sample>(context, listen: false)
          .setName(tabController.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.pinkAccent,
      child: TabBar(
        tabs: [
          Text(
            'tab01',
          ),
          Text(
            'tab02',
          ),
          Text(
            'tab03',
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
