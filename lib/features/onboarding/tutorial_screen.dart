import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktokclone/features/onboarding/widgets/tutorialpage.dart';
import 'package:tiktokclone/features/utils.dart';

enum Direction { right, left }

//(1) announce enum.
enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  //(2) make parameter in the state using the enum above.
  Page _showingPage = Page.first;

  void _onPanUdate(DragUpdateDetails details) {
    // print(details);
    if (details.delta.dx > 0) {
      //dx. : distance from x axis.
      //when the user drag to the right side.
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // to the left.
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUdate,
      // pan : when the user dragging on the screen.
      onPanEnd: _onPanEnd,
      // onPanEnd : when the user finishes the dragging.
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
                firstChild: const TutorialPage(
                  text: 'Watch cool videos',
                  bodytext:
                      'Videos are personalized for you based on what you watch, like and share.',
                ),
                secondChild: const TutorialPage(
                  text: 'Swipe the screen',
                  bodytext:
                      'You can enjoy other video at ease specially recommended by algorithm.',
                ),
                crossFadeState: _showingPage == Page.first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300)),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: isDarkMode(context) ? Colors.black : Colors.white,
          height: Sizes.size80 + Sizes.size20,
          surfaceTintColor: Colors.transparent,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size10,
              bottom: Sizes.size10,
              right: Sizes.size12,
              left: Sizes.size12,
            ),
            child: AnimatedOpacity(
              opacity: _showingPage == Page.first ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: CupertinoButton(
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: _onEnterAppTap,
                child: const Text(
                  'Enter the App',
                  style: TextStyle(
                    color: Colors.white, // Set the desired text color
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
