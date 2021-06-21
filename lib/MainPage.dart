import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('BarPage'),
              onTap: () {
                Navigator.pushNamed(context, '/BarPage');
              },
              trailing: Icon(Icons.arrow_forward),
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
    );
  }
}
