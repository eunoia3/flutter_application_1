import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'WebViewPage.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'http://livem.gsshop.com/gsshop_hd/_definst_/gsshop_hd.stream/playlist.m3u8',
    );
    // ..initialize().then((_) {
    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoPlayerPage'),
      ),
      body: Container(
        color: Colors.green,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // 만약 VideoPlayerController 초기화가 끝나면, 제공된 데이터를 사용하여
              // VideoPlayer의 종횡비를 제한하세요.
              return Container(
                color: Colors.redAccent,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // 영상을 보여주기 위해 VideoPlayer 위젯을 사용합니다.
                  child: VideoPlayer(_controller),
                ),
              );
            } else {
              // 만약 VideoPlayerController가 여전히 초기화 중이라면,
              // 로딩 스피너를 보여줍니다.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(),
                ),
              );
            },
            child: Icon(
              Icons.outbond,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ],
      ),
    );

    // return MaterialApp(
    //   title: 'Video Demo',
    //   home: Scaffold(
    //     body: Center(
    //       child: _controller.value.isInitialized
    //           ? AspectRatio(
    //               aspectRatio: _controller.value.aspectRatio,
    //               child: VideoPlayer(_controller),
    //             )
    //           : Container(),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         setState(() {
    //           _controller.value.isPlaying
    //               ? _controller.pause()
    //               : _controller.play();
    //         });
    //       },
    //       child: Icon(
    //         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
