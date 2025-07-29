import 'package:flutter/material.dart';

class HadithContent extends StatelessWidget {
  const HadithContent(
      {super.key, required this.content, required this.contentColor});

  final String content;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Text(
      content,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: contentColor),
    ));
  }
}
