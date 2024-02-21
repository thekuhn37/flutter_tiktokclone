import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Activity"),
      ),
      body: ListView(
        // when you use real data, it's better to use listview.builder.
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        // it is when you want to give padding to the ListView.
        children: [
          Gaps.v14,
          Text(
            'New',
            style: TextStyle(
              fontSize: Sizes.size14,
              color: Colors.grey.shade600,
            ),
          ),
          Gaps.v14,
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: Sizes.size48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: Sizes.size1,
                ),
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.black,
                ),
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: "Account updates:",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: Sizes.size16,
                ),
                children: [
                  const TextSpan(
                    text: " Upload longer videos",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " 1h",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade600,
              size: Sizes.size16,
            ),
          )
        ],
      ),
    );
  }
}
