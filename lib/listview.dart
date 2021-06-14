import 'package:flutter/material.dart';

final List<String> imgs = <String>[
  'assets/images/img_blue.png',
  'assets/images/img_mint.png',
  'assets/images/img_mix.png',
  'assets/images/img_pink.png',
  'assets/images/img_purple.png',
  'assets/images/img_skyblue.png',
  'assets/images/img_white.png',
  'assets/images/img_yellow.png',
];

class ListViewPage extends StatefulWidget {

  final String title;

  ListViewPage({Key? key, required this.title}) : super(key: key);
  
  @override
  _ListViewPageState createState() => _ListViewPageState();

}

class _ListViewPageState extends State<ListViewPage> {
// var imageUrl = "https://images.pexels.com/photos/912110/pexels-photo-912110.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(  // 구글 기본 디자인인 Material Design을 써서 앱을 만든다. 
      title: '플러터 앱', 
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
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
              title: Text('Favorites'),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('Music'),
              icon: Icon(Icons.music_note),
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
     
        
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),     
          itemCount: imgs.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.pink[index*100],
              child: Row(
                children: [
                  Image.asset(imgs[index]),
                  Text('Item : $index'),
                  Text('Item : $index'),
                ],
              )
            );
          },       
        ),
      ),
    );
  }
}