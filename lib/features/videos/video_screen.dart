import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

// PageView > 컨테이너 마다 1개의 페이지 처리 scrollDirection: Axis.vertical, 세로 처리

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {

  final PageController _pageController = PageController();

  final Duration _scrollDuration = Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  int _itemCount = 4;

  // List<Color> colors = [
  //   Colors.blue,
  //   Colors.red,
  //   Colors.yellow,
  //   Colors.teal,
  // ];
  // if (page == _itemCount - 1) {
  // Color randomColor =
  // Colors.primaries[Random().nextInt(Colors.primaries.length)];
  // colors.add(randomColor);
  // _itemCount++;
  // }

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page, duration: _scrollDuration,
      curve: _scrollCurve,
    );
    setState(() {});
  }

  void _onVideoFinished() {
    return ;
    // 다음 영상 재생  : _pageController.nextPage(duration:_scrollDuration, curve: _scrollCurve);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  // 새로고침 돌아가는 것 임의로 5초 줌.
  Future<void> _onRefresh(){
    return Future.delayed(
      const Duration(seconds: 5),
    );
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50,
      edgeOffset: 30,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: _itemCount,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) => VideoPost(onVideoFinished:_onVideoFinished ,index : index)
      ),
    );
  }
}
