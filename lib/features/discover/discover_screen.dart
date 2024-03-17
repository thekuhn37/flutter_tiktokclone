// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/breaktpoints.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/utils.dart';

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

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  bool _isWriting = false;
  late final TextEditingController _textEditingController;
  late final TabController _tabController;

  // void _onSearchChanged(String value) {
  //   print(value);
  // }

  // void _onSearchSubmitted(String value) {
  //   print(value);
  // }

  @override
  void initState() {
    _isWriting = false;
    _textEditingController = TextEditingController();
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _onClearTapped() {
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
  }

  void _onTextChanged(String text) {
    setState(
      () {
        text.isNotEmpty ? _isWriting = true : _isWriting = false;
      },
    );
  }

  void _onTextSubmitted(String text) {
    FocusScope.of(context).unfocus();
    print(_textEditingController.value);
    setState(
      () {
        _isWriting = false;
      },
    );
  }

  void _onTapbarTapped(int num) {
    FocusScope.of(context).unfocus();
    setState(
      () {
        _tabController.index = num;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // elevation: 1,
          centerTitle: true,
          title: Container(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            // height: 40,
            child: TextField(
              controller: _textEditingController,
              onChanged: _onTextChanged,
              onSubmitted: _onTextSubmitted,
              textInputAction: TextInputAction.go,
              cursorColor: Theme.of(context).colorScheme.onPrimary,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Search exercise',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.size12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                // fillColor: Colors.blue,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size12,
                  vertical: Sizes.size4,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                    top: Sizes.size12,
                    left: Sizes.size10,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: Sizes.size20,
                  ),
                ),
                suffixIcon: _isWriting
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: Sizes.size12,
                          right: Sizes.size6,
                        ),
                        child: GestureDetector(
                          onTap: _onClearTapped,
                          child: const FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            size: Sizes.size20,
                            color: Colors.black45,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
          // CupertinoSearchTextField(
          //   controller: _textEditingController,
          //   onChanged: _onSearchChanged,
          //   onSubmitted: _onSearchSubmitted,
          // ),
          bottom: TabBar(
            controller: _tabController,
            onTap: _onTapbarTapped,
            splashFactory: NoSplash.splashFactory,
            tabAlignment: TabAlignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(Sizes.size6),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.md ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 22,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                    builder: (context, constraints) => Column(
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
                          // ${constraints.maxWidth}
                          "This is a very long caption. In Tiktok, people can leave their comments here..",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Sizes.size16 + Sizes.size2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.v10,
                        if (constraints.maxWidth < 200 ||
                            constraints.maxWidth > 240)
                          DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isDarkMode(context)
                                  ? Colors.white
                                  : Colors.grey.shade600,
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
                    ),
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
