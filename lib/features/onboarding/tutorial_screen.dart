import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // (3) How many pages that we are going to have.
      child: Scaffold(
        // (2) Wrap the scaffold with DefaulTabController.
        body: const SafeArea(
          // If there's no app bar, use "safe area".
          child: TabBarView(
            // (1) Wrap the padding with 'TabBarView' widget
            children: [
              // the number of elements in children is equal to the pages
              // in the length.
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'Watch cool videos!',
                      style: TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      'Videos are personalized for you based on what you watch, like and share.',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'Watch cool videos!(2)',
                      style: TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      'Videos are personalized for you based on what you watch , like and share.',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'Watch cool videos!(3)',
                      style: TextStyle(
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      'Videos are personalized for you based on what you watch , like and share.',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          surfaceTintColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  selectedColor: Colors.black38,
                ),
              ],
/*
If you want to TabPageSelector while you are using TabBarView,
then both of the widgets must be under(or share) the same 
'DefaultTabController'.
*/
            ),
          ),
        ),
      ),
    );
  }
}
