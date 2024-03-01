import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/users/widgets/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxisScrolled) {
            return [
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
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.33,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              Sizes.size4,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
                      child: Text(
                        "Welcome to Harry's page. Leave comment then I'll answer yours.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size14,
                        ),
                        Gaps.h4,
                        Text(
                          'https://harry.korea.ac.kr',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.zero,
                  itemCount: 18,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size3,
                    mainAxisSpacing: 0,
                    childAspectRatio: 9 / 13.8,
                  ),
                  itemBuilder: (context, index) => Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 13.5,
                            // width / height
                            child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: "assets/images/placeholder.jpg",
                                image:
                                    "https://steelfitusa.com/cdn/shop/articles/The-Anatomy-of-the-Biceps.jpg?v=1660142064&width=1500"),
                          ),
                        ],
                      )
                  // Image.asset("assets/images/biceps.jpg"),
                  ),
              const Center(
                child: Text('Page2'),
              ),
            ],
          ),
        ),
      ),
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
