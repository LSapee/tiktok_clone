import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';

import 'widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "oddly satisfying",
  "Home & Garden"
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen>{
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll(){
    if(_scrollController.offset > 100){
      if(_showTitle) return ;
      setState(() {
        _showTitle = true;
      });
    }else{
      setState(() {
        _showTitle = false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1: 0,
          duration: Duration(microseconds: 300),
          child: const Text("Choose your interests"),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          // 스크롤 가능하게 하기 위해서
          child: Padding(
            padding: EdgeInsets.only(
              left:Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                Text(
                  "Choose your interests",
                  style: TextStyle(fontSize: Sizes.size40),
                ),
                Gaps.v24,
                Text(
                  "Get better video recommendations",
                  style: TextStyle(fontSize: Sizes.size20),
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: Sizes.size40,
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: CupertinoButton(
            onPressed:_onNextTap,
            color:Theme.of(context).primaryColor,
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}

