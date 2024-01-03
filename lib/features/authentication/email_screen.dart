import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          // foregroundColor: Colors.amber,
          title: const Text(
            "Sign up",
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v28,
              Text(
                'Create username',
                style: TextStyle(
                  fontSize: Sizes.size20 + Sizes.size2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              Text(
                'You can always change this later.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gaps.h20,
            ],
          ),
        ));
  }
}
