import 'package:flutter/material.dart';
import 'model/BearItem.dart';

final bearItem = {
  "list": [
    {"image": "assets/images/img_blue.png", "name": "파랑이"},
    {"image": "assets/images/img_mint.png", "name": "민트트"},
    {"image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"image": "assets/images/img_white.png", "name": "하양이"},
    {"image": "assets/images/img_pink.png", "name": "분홍이"},
    {"image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"image": "assets/images/img_purple.png", "name": "보라라"},
    {"image": "assets/images/img_mix.png", "name": "믹스스"}
  ]
};
BearList? bearList;

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bearList = BearList.fromJson(bearItem);

    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('MyAAAAAAPP~!'),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('MainPage'),
              onTap: () {
                Navigator.pushNamed(context, '/MainPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                //leading : 왼쪽
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('BarPage'), //title : 중앙
              onTap: () {
                Navigator.pushNamed(context, '/BarPage');
              },
              trailing: Icon(Icons.arrow_forward), //trailing : 오른쪽
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('ListviewBasicPage'),
              onTap: () {
                Navigator.pushNamed(context, '/ListviewBasicPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.list_alt_sharp,
                color: Colors.grey,
              ),
              title: Text('ListviewPage'),
              onTap: () {
                Navigator.pushNamed(context, '/ListviewPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey,
              ),
              title: Text('GridviewPage'),
              onTap: () {
                Navigator.pushNamed(context, '/GridviewPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.pages,
                color: Colors.grey,
              ),
              title: Text('PageviewPage'),
              onTap: () {
                Navigator.pushNamed(context, '/PageviewPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('TextFieldPage'),
              onTap: () {
                Navigator.pushNamed(context, '/TextFieldPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('MyAlarm'),
              onTap: () {
                Navigator.pushNamed(context, '/MyAlarm');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('MyStopPage'),
              onTap: () {
                Navigator.pushNamed(context, '/MyStopPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('MyTime'),
              onTap: () {
                Navigator.pushNamed(context, '/MyTime');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('ShowDialogPage'),
              onTap: () {
                Navigator.pushNamed(context, '/ShowDialogPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('CarouselSliderPage'),
              onTap: () {
                Navigator.pushNamed(context, '/CarouselSliderPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('CardPage'),
              onTap: () {
                Navigator.pushNamed(context, '/CardPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('AnimatedContainerPage'),
              onTap: () {
                Navigator.pushNamed(context, '/AnimatedContainerPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('AnimatedOpacityPage'),
              onTap: () {
                Navigator.pushNamed(context, '/AnimatedOpacityPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('OrientationPage'),
              onTap: () {
                Navigator.pushNamed(context, '/OrientationPage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('DismissiblePage'),
              onTap: () {
                Navigator.pushNamed(context, '/DismissiblePage');
              },
              trailing: Icon(Icons.arrow_forward),
            ),

            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //     color: Colors.grey,
            //   ),
            //   title: Text('MyTimer'),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/MyTimer');
            //   },
            //   trailing: Icon(Icons.arrow_forward),
            // ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Image.asset(
          //     bearList!.list!.elementAt(0).image!), //bearList 의 0번째 요소의 image
          // Text(bearList!.list!.elementAt(0).name!), //bearList 의 0번째 요소의 name
        ],
      ),
      // body: Image.asset(bearList!.list!.elementAt(0).image!),
      // body: Center(
      //   child: Column(
      //     children: [
      //       Center(
      //         child: LinearProgressIndicator(),
      //       ),
      //       Center(
      //         child: CircularProgressIndicator(),
      //       ),
      //     ],
      //   ),
      // ),
      // body: Container(
      // child: Image.asset('assets/images/img_blue.png'),
      // child: Image.network(
      // 'https://images.pexels.com/photos/912110/pexels-photo-912110.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
      // ),
    );
  }
}
