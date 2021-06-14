import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({ Key? key }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  // var imageUrl = "https://images.pexels.com/photos/912110/pexels-photo-912110.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

  int _selectedIndex = 0;
  List _widgetOptions = [
    Text(
      'Menu',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'Home',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'Places',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'News',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(  // 구글 기본 디자인인 Material Design을 써서 앱을 만든다. 
      title: '플러터 앱', 
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Bar'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,  //Bar의 배경색
          selectedItemColor: Colors.white,  //선택된 아이템의 색상
          unselectedItemColor: Colors.white.withOpacity(.60),  //선택 안된 아이템의 색상
          selectedFontSize: 14,  //선택된 아이템의 폰트사이즈
          unselectedFontSize: 14,  //선택 안된 아이템의 폰트사이즈
          currentIndex: _selectedIndex,  //현재 선택된 Index
          onTap: (int index) {  //bottomNavigationBar 클릭 시 호출
            setState(() {  //setState()를 추가하여 인덱스를 누를때마다 빌드를 다시함
              _selectedIndex = index; //index는 처음 아이템 부터 0, 1, 2, 3
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Menu'),
              icon: Icon(Icons.menu),
            ),
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Places'),
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              title: Text('News'),
              icon: Icon(Icons.library_books),
            ),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        
      ),
  );
  }
}