import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowDialogPage extends StatefulWidget {
  const ShowDialogPage({Key? key}) : super(key: key);

  @override
  _ShowDialogPageState createState() => _ShowDialogPageState();
}

class _ShowDialogPageState extends State<ShowDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowDialogPage'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              showPop();
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: Colors.amberAccent,
              )),
              alignment: Alignment.centerLeft,
              child: Text(
                'Dialog 띄우기',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showDate();
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: Colors.amberAccent,
              )),
              alignment: Alignment.centerLeft,
              child: Text(
                'DatePicker 띄우기',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showTime();
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: Colors.amberAccent,
              )),
              alignment: Alignment.centerLeft,
              child: Text(
                'TimePicker 띄우기',
              ),
            ),
          ),
          GestureDetector(
            //클릭 시 아무효과가 없음
            onTap: () {},
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: Colors.amberAccent,
              )),
              alignment: Alignment.centerLeft,
              child: Text(
                'GestureDetector 사용하기',
              ),
            ),
          ),
          InkWell(
            //클릭 시 물결 효과
            onTap: () {},
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: Colors.amberAccent,
              )),
              alignment: Alignment.centerLeft,
              child: Text(
                'InkWell 사용하기',
              ),
            ),
          ),
          InkWell(
            //클릭 시 물결 효과
            onTap: () {},
            child: Builder(
              builder: (context) => Center(
                child: TextButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('나는 스낵바'),
                      action: SnackBarAction(
                        onPressed: () {},
                        label: '취소',
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Show SnackBar'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showPop() {
    showDialog(
      context: context,
      barrierDismissible:
          false, //다이얼로그 바깥을 터치 시에 닫히도록 하는지 여부 (true: 닫힘, false: 닫히지않음)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            //제목 정의
            '제목이 들어갑니다.',
          ),
          content: SingleChildScrollView(
            //내용 정의
            child: ListBody(
              children: <Widget>[
                Text(
                  'Alert Dialog 입니다.',
                ),
                Text(
                  '😀😃😄😁😆😊.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            //버튼 정의
            TextButton(
              onPressed: () {
                Navigator.push(
                  // 새로운 화면 호출
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text(
                '확인',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 화면을 종료하고 이전 화면으로 돌아가기
              },
              child: Text(
                '취소',
              ),
            ),
          ],
        );
      },
    );
  }

  void showDate() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2020), //시작일
      lastDate: DateTime(2022), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      Fluttertoast.showToast(
        msg: dateTime.toString(),
        toastLength: Toast.LENGTH_LONG,
        // gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  void showTime() {
    Future<TimeOfDay?> selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    selectedTime.then((timeOfDay) {
      Fluttertoast.showToast(
        msg: timeOfDay.toString(),
        toastLength: Toast.LENGTH_LONG,
        // gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }
}
