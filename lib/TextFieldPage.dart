import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();

  const TextFieldPage({Key? key}) : super(key: key);
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _textController = new TextEditingController();
  Widget _changedTextWidget = Container();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: false,
        title: Text(
          'TextFieldPage',
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: _buildTextWidget(),
      ),
    );
  }

  Widget _buildTextWidget() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textController,
                  // onSubmitted: sendMsg,
                  // onChanged: checkText,
                  onSubmitted: (text) {
                    sendMsg(text);
                  },
                  onChanged: (text) {
                    checkText(text);
                  },
                  decoration: InputDecoration(
                    labelText: '텍스트 입력',
                    // hintText: '텍스트를 입력해주세요',
                    border: OutlineInputBorder(), //외곽선
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  sendMsg(_textController.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.lightBlue[200],
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'SEND',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
                bottom: 500,
              ),
              alignment: Alignment.center,
              color: Colors.yellow[200],
              child: _changedTextWidget,
            ),
          ),
        ],
      ),
    );
  }

  void sendMsg(String text) {
    _textController.clear();
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      // gravity: ToastGravity.CENTER,  //위치(default 는 아래)
    );
  }

  void checkText(String text) {
    _changedTextWidget = Container(
      child: Text.rich(
        //Text.rich 와 TextSpan 을 사용하여 다양한 스타일의 텍스트를 한줄에 표시할 수 있게 하는 위젯
        TextSpan(
          text: '=> ', //기본 스타일의 텍스트 (default text style)
          children: [
            TextSpan(
              //TextSpan 위젯을 이용하여 다양한 스타일의 텍스트 사용 가능
              text: '$text',
              style: TextStyle(
                fontSize: 20,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
    setState(() {}); //setState 를 사용하여 화면 다시 그려줌
  }
}
