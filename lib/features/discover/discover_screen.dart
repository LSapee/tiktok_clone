import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = ["Top", "Users", "Videos", "LIVE", "Shopping", "brands"];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>{

  final TextEditingController _textEditingController = TextEditingController(text: "Initial Text");
  int _tabIndex = 0;
  void _onSearchChanged(String value){

  }

  void _onSearchSubmitted(String value){

  }


  @override
  void dispose() {
    _textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
// 코드 챌린지 1 탭 누르면 키보드 사라지게 하기
// 코드 챌린지 2 검색창 꾸미기
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            title: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
            ),
            bottom: TabBar(
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              unselectedLabelColor: Colors.grey.shade500,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                itemCount: 20,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.all(
                  Sizes.size6,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10, // 가로 사이간격
                  mainAxisSpacing: Sizes.size10, // 세로 간격
                  childAspectRatio: 9 / 16, // 사각형 비율 조절
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(Sizes.size4,),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 12,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/temp.jpg",
                          image:
                              "https://www.coinreaders.com/imgdata/coinreaders_com/202403/2024032855201096.jpg",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that im upload just now currently",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(color:Colors.grey.shade500,fontWeight: FontWeight.w600),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.blueAccent,
                          ),
                          Gaps.v4,
                          Expanded(
                            child: Text(
                              "My avatar is going to very  long",style: TextStyle(
                              color:Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                              maxLines: 1,
                              overflow:  TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h2,
                          FaIcon(FontAwesomeIcons.heart
                          ,size: Sizes.size16,
                            color:Colors.grey.shade600,),
                          Gaps.h7,
                          Text("2.5M",),
                        ],
                      ),
                    )
                  ],
                ),
                // NetWork 이미지 로딩전에는 asset에 있던 이미지 보여주다가 로딩되면 해당 네트워크 이미지 보여주기
                // Container(
                //   color: Colors.purple,
                //   child: Center(
                //     child: Text(
                //       "$index",
                //     ),
                //   ),
                // ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size24,
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}
