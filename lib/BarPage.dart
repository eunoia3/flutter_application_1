import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BarPage extends StatefulWidget {

  const BarPage({ 
    Key? key 
  }) : super(key: key);

  @override
  _BarPageState createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {

  int _selectedIndex = 0;
  List _widgetOptions = [
    Text(
      'Mail',
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('BarPage'),
          centerTitle: true,  //제목 text 가운데정렬 여부 
          backgroundColor: Colors.pinkAccent,
          leading: IconButton(
            icon: Icon(Icons.menu), 
            onPressed: () => showToast('leading버튼'),
          ),
          actions: [
              IconButton(
                icon: Icon(Icons.search), 
                onPressed: () => showToast('action버튼1'),
              ),
              IconButton(
                icon: Icon(Icons.navigate_next), 
                onPressed: () => showToast('action버튼2'),
              ),
          ],
          elevation: 100,  //appBar 그림자 (0일 경우 그림자 x)
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
              title: Text('Mail'),
              icon: Icon(Icons.mail),
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
        body: Container(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        
      ),
    );
  }


  /* Toast 띄우기 */
  void showToast(String msg) {
    print(' == msg : $msg');
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG, 
      // gravity: ToastGravity.CENTER,  //위치(default 는 아래)
    );
  }

}