import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final screens = [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Discover"),
    ),
    Container(),
    Center(
      child: Text("inbox"),
    ),
    Center(
      child: Text("Profile"),
    )
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>Scaffold(
        appBar: AppBar(title: const Text("record video")),
      ),
      fullscreenDialog: true,),
    );
  }

  //screens.elementAt(_selectedIndex), 사용시 해당 화면 나갔다가 다시 돌아오면 새로 렌더링 되어서 이전 작업내역 사라짐
  // Offstage 사용시 child를 빌드 하지만 hide 상태
  // material 3 -> 안드로이드 느낌
  // Cupertion -> IOS 느낌  !!! CupertinoApp
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex==0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Text("감자"),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Text("감자"),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Text("감자"),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap:_onPostVideoButtonTap,
                child: PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
