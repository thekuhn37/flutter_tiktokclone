import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/breaktpoints.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/settings/settings_screen.dart';
import 'package:tiktokclone/features/users/widgets/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;
  final String tab;
  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: DefaultTabController(
        initialIndex: widget.tab == "likes" ? 1 : 0,
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxisScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
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
                      Gaps.v20,
                      if (width > Breakpoints.md) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
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
                                    Text(
                                      '@${widget.username}',
                                      style: const TextStyle(
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
                              ],
                            ),
                            Gaps.h64,
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
                                  const UserInfo(
                                      numb: '10.5M', info: 'Followers'),
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
                          ],
                        )
                      ] else ...[
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
                      ],
                      Gaps.v14,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size60,
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: Breakpoints.sm,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size10,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                              Gaps.h5,
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey.shade500,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        Sizes.size4,
                                      ),
                                    ),
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.youtube,
                                      color: Colors.black,
                                      size: Sizes.size18,
                                    ),
                                  ),
                                ),
                              ),
                              Gaps.h5,
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey.shade500,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        Sizes.size4,
                                      ),
                                    ),
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.arrowDown,
                                      color: Colors.black,
                                      size: Sizes.size18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width,
                      //   child: Row(
                      //     children: [
                      //       FractionallySizedBox(
                      //         widthFactor: 0.4,
                      //         child: Container(
                      //           padding: const EdgeInsets.symmetric(
                      //             vertical: Sizes.size10,
                      //           ),
                      //           decoration: BoxDecoration(
                      //             color: Theme.of(context).colorScheme.onPrimary,
                      //             borderRadius: const BorderRadius.all(
                      //               Radius.circular(
                      //                 Sizes.size4,
                      //               ),
                      //             ),
                      //           ),
                      //           child: const Text(
                      //             'Follow',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w600,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //       ),
                      //       Gaps.h8,
                      //       FractionallySizedBox(
                      //         widthFactor: 0.3,
                      //         child: Container(
                      //           padding: const EdgeInsets.symmetric(
                      //             vertical: Sizes.size10,
                      //           ),
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             border: Border.all(
                      //               color: Colors.grey.shade900,
                      //               width: 1,
                      //             ),
                      //             borderRadius: const BorderRadius.all(
                      //               Radius.circular(
                      //                 Sizes.size4,
                      //               ),
                      //             ),
                      //           ),
                      //           child: const FaIcon(
                      //             FontAwesomeIcons.youtube,
                      //             color: Colors.black,
                      //             size: Sizes.size14,
                      //           ),
                      //         ),
                      //       ),
                      //       Gaps.h8,
                      //       FractionallySizedBox(
                      //         widthFactor: 0.3,
                      //         child: Container(
                      //           padding: const EdgeInsets.symmetric(
                      //             vertical: Sizes.size10,
                      //           ),
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             border: Border.all(
                      //               color: Colors.grey.shade900,
                      //               width: 1,
                      //             ),
                      //             borderRadius: const BorderRadius.all(
                      //               Radius.circular(
                      //                 Sizes.size4,
                      //               ),
                      //             ),
                      //           ),
                      //           child: const FaIcon(
                      //             FontAwesomeIcons.youtube,
                      //             color: Colors.black,
                      //             size: Sizes.size14,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      ,
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
                    padding: EdgeInsets.zero,
                    itemCount: 18,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width > Breakpoints.md ? 5 : 3,
                      crossAxisSpacing: Sizes.size3,
                      mainAxisSpacing: 0,
                      childAspectRatio: 9 / 13.8,
                    ),
                    itemBuilder: (context, index) => Stack(
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
                            const Positioned(
                              bottom: Sizes.size5,
                              left: Sizes.size4,
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.play,
                                    size: Sizes.size12,
                                    color: Colors.white,
                                  ),
                                  Gaps.h5,
                                  Text(
                                    '4.1M',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Sizes.size12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
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
