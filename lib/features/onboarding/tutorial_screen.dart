import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.left;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx < 0) {
      // 우측 이동
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // 좌측 이동
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.first;
      });
    } else {
      setState(() {
        _showingPage = Page.second;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainNavigation()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.v80,
                        Text(
                          "First!",
                          style: TextStyle(
                            fontSize: Sizes.size40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.v16,
                        Text(
                          "Videos are personalized for you based on what you watch, like, and share.",
                          style: TextStyle(fontSize: Sizes.size20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              secondChild: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.v80,
                        Text(
                          "Second!",
                          style: TextStyle(
                            fontSize: Sizes.size40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.v16,
                        Text(
                          "Videos are personalized for you based on what you watch, like, and share.",
                          style: TextStyle(fontSize: Sizes.size20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Sizes.size24, horizontal: Sizes.size24),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _showingPage == Page.first ? 0 : 1,
              child: CupertinoButton(
                  onPressed: _onEnterAppTap,
                  color: Theme.of(context).primaryColor,
                  child: const Text("Enter the app")),
            ),
          ),
        ),
      ),
    );
  }
}

//
// return DefaultTabController(
// // DefaultTabController 안에 TabBarview와 TabBarSelector가 같이 있어야 한다.
// length: 3,
// child: Scaffold(
// body: SafeArea(
// child: TabBarView(
// children: [
// // 각각의 페딩안쪽이 한장의 페이지
//
// Padding(
// padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Gaps.v52,
// Text(
// "Follow the rules of!",
// style: TextStyle(
// fontSize: Sizes.size40,
// fontWeight: FontWeight.bold,
// ),
// ),
// Gaps.v16,
// Text(
// "Videos are personalized for you based on what you watch, like, and share.",
// style: TextStyle(fontSize: Sizes.size20),
// ),
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Gaps.v52,
// Text(
// "Enjoy the ride!",
// style: TextStyle(
// fontSize: Sizes.size40,
// fontWeight: FontWeight.bold,
// ),
// ),
// Gaps.v16,
// Text(
// "Videos are personalized for you based on what you watch, like, and share.",
// style: TextStyle(fontSize: Sizes.size20),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// bottomNavigationBar: BottomAppBar(
// child: Container(
// padding: EdgeInsets.symmetric(vertical: Sizes.size48),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: const [
// TabPageSelector(
// color: Colors.white,
// selectedColor: Colors.black38,
// ),
// ],
// ),
// ),
// ),
// ),
// );
