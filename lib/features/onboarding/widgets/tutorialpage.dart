import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class TutorialPage extends StatelessWidget {
  final String text;
  final String bodytext;

  const TutorialPage({
    super.key,
    required this.text,
    required this.bodytext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v80,
        Text(
          text,
          style: const TextStyle(
            fontSize: Sizes.size32,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gaps.v16,
        Text(
          bodytext,
          style: const TextStyle(
            fontSize: Sizes.size20,
          ),
        ),
      ],
    );
  }
}
