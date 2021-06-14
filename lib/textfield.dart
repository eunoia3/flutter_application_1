import 'package:flutter/material.dart';


class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();

  // const SearchScreen({
  //   Key? key
  // }) : super(key: key);

}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(' === TextFieldPage ');
    // selectInfo();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlue,
      //   centerTitle: false,
      //   title: Text(
      //     '무우야야호호',
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.only(
          top: 60,
        ),
        child: _buildTextComposer(),
      ),
    );
  }

  // void selectInfo() async {
  //   var response;
  //   try {
  //     response = await restService.get(
  //         path: '/section/apis/v2.8/search/autoComplete?query=ni', isRaw: true);
  //     print(' === response :: $response');
  //     // if (response != null && 'S' == response.toString()) {
  //     //   //성공
  //     // } else {
  //     //   //실패
  //     // }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Widget _buildTextComposer() {
    return Container(
      height: 36,
      color: Colors.grey,
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: '검색어를 입력해주세요'),
              ),
            ),
            GestureDetector(
              onTap: () async {
                _handleSubmitted(_textController.text);
                // (Router.of(context).routerDelegate as AppRouterDelegate).push(
                //     RoutePath.baseWebView(
                //       id: widget.view.sub![index].action,
                //     ),
                //   context,
                // );
              }, 
              child: Container(
                color: Colors.yellow,
                margin: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: Text(
                    '취소'
                ),
              ),
            ),
          ],
        ));
  }


  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
