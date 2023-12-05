import 'package:flutter/material.dart';

import 'constants/gaps.dart';
import 'constants/sizes.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok Clone Demo',
      theme: ThemeData(primaryColor: Color(0xFFE9435A)),
      home: Padding(
        padding: const EdgeInsets.all(Sizes.size14),
        child: Container(
          child: Row(
            children: [
              Text('hello'),
              Gaps.h20,
              Text("hello"),
            ],
          ),
        ),
      ),
    );
  }
}
