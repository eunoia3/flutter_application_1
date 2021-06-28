import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderContentPage.dart';
import 'ProviderCountPage.dart';

// class ProviderPage extends StatelessWidget {
//   const ProviderPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return Provider<int>.value(
//     //   value: 5,
//     //   child: ProviderContentPage(),
//     // );
//     // return Container();
//     return ChangeNotifierProvider<Counter>(
//       builder: (_) => Counter(0), // 초기값 정하기
//       child: MaterialApp(
//         title: 'Flutter Value',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: ProviderContentPage(),
//       ),
//     );
//   }
// }
class ProviderPage extends StatelessWidget {
  const ProviderPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (BuildContext context) {
        return Counter(0);
      },
      child: MaterialApp(
        title: 'Flutter Value',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProviderContentPage(),
      ),
    );
  }
}
