import 'package:flutter/material.dart';
import 'HttpService.dart';
import 'model/BearItem.dart';

class FutureScrollPage extends StatefulWidget {
  const FutureScrollPage({
    Key? key,
  }) : super(key: key);

  @override
  _FutureScrollPageState createState() => _FutureScrollPageState();
}

class _FutureScrollPageState extends State<FutureScrollPage> {
  late ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureScrollPage'),
        ),
        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //FloatingActionButton 1 : 가장 위로 강제 스크롤
              FloatingActionButton(
                onPressed: () {
                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    _scrollController.animateTo(
                      _scrollController.position.minScrollExtent,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                child: Icon(Icons.arrow_upward),
              ),

              //FloatingActionButton 1 : 가장 아래로 강제 스크롤
              FloatingActionButton(
                onPressed: () {
                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                child: Icon(Icons.arrow_downward),
              ),
            ],
          ),
        ),
        body: FutureBuilder<BearList>(
          //FutureBuilder 를 사용하여 데이터 가져오기
          future: HttpService().fetchBear(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return bodyWidget(snapshot.data!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget bodyWidget(BearList bearList) {
    return Container(
      child: ListView.separated(
        controller: _scrollController,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.grey,
          height: 4,
        ), //separatorBuilder : item과 item 사이에 그려질 위젯 (개수는 itemCount -1 이 된다)
        itemCount: bearList.list!.length, //리스트의 개수
        itemBuilder: (BuildContext context, int index) {
          //리스트의 반목문 항목 형성
          return Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.pink[index * 100],
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '$index',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Image.asset(
                  bearList.list!.elementAt(index).image!,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      bearList.list!.elementAt(index).name!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
