import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/features/discover/discover_screen.dart';
import 'package:tiktokclone/features/inbox/inbox_screen.dart';
import 'package:tiktokclone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktokclone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktokclone/features/users/user_profile_screen.dart';
import 'package:tiktokclone/features/utils.dart';
import 'package:tiktokclone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;
  bool _onTapDown = false;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Record Video",
            ),
          ),
        ),
        fullscreenDialog: true,
        // Once this button is tapped, the screen will be
        // on top of every thing else.
      ),
    );
    setState(() {
      _onTapDown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex == 0 ? false : true,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 1 ? false : true,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 3 ? false : true,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 4 ? false : true,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      // or 'screens.elementAt(_selectedIndex)'
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color:
            _selectedIndex == 0 || isDark ? Colors.black : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
                label: 'Home',
                selectedicon: FontAwesomeIcons.houseChimney,
                icon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
                selectedindex: _selectedIndex),
            NavTab(
                label: 'Discover',
                selectedicon: FontAwesomeIcons.magnifyingGlassPlus,
                icon: FontAwesomeIcons.magnifyingGlass,
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
                selectedindex: _selectedIndex),
            Gaps.h24,
            GestureDetector(
              onTapDown: (details) {
                setState(() {
                  _onTapDown = true;
                });
              },
              onTapUp: (details) => _onPostVideoButtonTap(),
              child: PostVideoButton(
                onTapDown: _onTapDown,
                inverted: _selectedIndex != 0,
              ),
            ),
            Gaps.h24,
            NavTab(
                label: 'Inbox',
                selectedicon: FontAwesomeIcons.solidMessage,
                icon: FontAwesomeIcons.message,
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
                selectedindex: _selectedIndex),
            NavTab(
                label: 'Profile',
                selectedicon: FontAwesomeIcons.solidUser,
                icon: FontAwesomeIcons.user,
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
                selectedindex: _selectedIndex),
          ],
        ),
      ),
    );
  }
}
