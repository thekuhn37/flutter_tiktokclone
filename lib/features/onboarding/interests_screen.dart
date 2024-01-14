import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/onboarding/tutorial_screen.dart';
import 'package:tiktokclone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  // (1)Announce a final property named as '_scrollController,
  // the type of this variable is ScrollController
  // it is initialized as ScrollController().
  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 143) {
      if (_showTitle) return;
      // This code prevents calling setstate everytime when the scroll number is increasing
      // more than 100.
      setState(
        () {
          _showTitle = true;
        },
      );
    } else {
      setState(
        () {
          _showTitle = false;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }
// (4)Create an eventlistener inside the initState and dispose.

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        surfaceTintColor: Colors.white,
        title: AnimatedOpacity(
          opacity: _showTitle ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: const Text("Choose Your Interests"),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        // (3) Wrap SingleChildScrollView with the Scrollbar widget
        // and put _scrollController at Scrollbar too.
        child: SingleChildScrollView(
          controller: _scrollController,
          // (2)deliver the controller we made at SingleChildscrollVeiw
          child: Padding(
            padding: const EdgeInsets.only(
              right: Sizes.size24,
              left: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v12,
                Text(
                  'Get better video recommendations.',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.grey.shade600,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  // wrap puts children horizontally. But if the child can not
                  // be put in one line, it will go to the next line.
                  runSpacing: 15,
                  // Put the space between the lines of children (vertically).
                  spacing: 15,
                  // Put the space between the childrens horizontally.
                  children: [
                    for (var interest in interests)
                      // Instead of collection for, 'ListViewBuilder' is better,
                      // as it only renders the items only shown in the screen.
                      // when the number of items is big.
                      InterestButton(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        height: 100,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size10,
            bottom: Sizes.size10,
            right: Sizes.size12,
            left: Sizes.size12,
          ),

          child: CupertinoButton(
            onPressed: _onNextTap,
            color: Theme.of(context).colorScheme.onPrimary,
            child: const Text(
              'Next',
              style: TextStyle(
                color: Colors.white, // Set the desired text color
              ),
            ),
          ),
          // child: Container(
          //   padding: const EdgeInsets.symmetric(vertical: Sizes.size14),
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.onPrimary,
          //   ),
          //   child: const Text(
          //     'Next',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: Sizes.size16,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
