import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key,
  required this.inverted});
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size9),
            ),
          ),
        ),
        Container(
          height: 30,
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: inverted ? Colors.black:Colors.white ,
            borderRadius: BorderRadius.circular(Sizes.size6),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: inverted ?  Colors.white:Colors.black ,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
