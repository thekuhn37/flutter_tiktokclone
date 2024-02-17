import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Hot",
  "Recents",
  "Records",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Chest Press");

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    print(value);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // elevation: 1,
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: Sizes.size16),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(children: [
          GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(Sizes.size6),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 22,
              ),
              itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Sizes.size8,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          // width / height
                          child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/images/placeholder.jpg",
                              image:
                                  "https://steelfitusa.com/cdn/shop/articles/The-Anatomy-of-the-Biceps.jpg?v=1660142064&width=1500"),
                        ),
                      ),
                      Gaps.v14,
                      const Text(
                        "This is a very long caption. In Tiktok, people can leave their comments here..",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v10,
                      DefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpeg"),
                            ),
                            Gaps.h6,
                            const Expanded(
                              child: Text(
                                "Harry.D.Hwang from Busan",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h6,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text(
                              '2.5M',
                            )
                          ],
                        ),
                      )
                    ],
                  )
              // Image.asset("assets/images/biceps.jpg"),
              ),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(
                tab,
                style: const TextStyle(
                  fontSize: Sizes.size28,
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
