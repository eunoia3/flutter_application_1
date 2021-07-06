import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TabPage',
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: TabBar(
              tabs: [
                Text(
                  'Tab1',
                ),
                Text(
                  'Tab2',
                ),
              ],
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFef763d),
                    Color(0xFFe3317d),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Text(
                  'Tab1 View',
                ),
                Text(
                  'Tab2 View',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
