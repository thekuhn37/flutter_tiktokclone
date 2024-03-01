import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Harry.D'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                size: Sizes.size20,
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                foregroundColor: Colors.blue,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/107166856?s=96&v=4",
                ),
                child: Text('Harry.D.Hwang'),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '@HarrythePassion',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h5,
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size16,
                    color: Colors.blue.shade500,
                  )
                ],
              ),
              Gaps.v24,
              SizedBox(
                height: Sizes.size48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const UserInfo(numb: '97', info: 'Following'),
                    VerticalDivider(
                      width: Sizes.size40,
                      thickness: 1,
                      color: Colors.grey.shade300,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    const UserInfo(numb: '10.5M', info: 'Followers'),
                    VerticalDivider(
                      width: Sizes.size48,
                      thickness: 1,
                      color: Colors.grey.shade300,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    const UserInfo(numb: '149.3M', info: 'Likes'),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  final String numb;
  final String info;

  const UserInfo({
    super.key,
    required this.numb,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          numb,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v1,
        Text(
          info,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
