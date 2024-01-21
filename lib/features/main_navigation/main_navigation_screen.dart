import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/features/main_navigation/stf_screen.dart';
import 'package:tiktokclone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex == 0 ? false : true,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 1 ? false : true,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 3 ? false : true,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 4 ? false : true,
            child: const StfScreen(),
          ),
        ],
      ),
      // or 'screens.elementAt(_selectedIndex)'
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              label: 'Home',
              selectedicon: FontAwesomeIcons.houseChimney,
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTab(
              label: 'Discover',
              selectedicon: FontAwesomeIcons.magnifyingGlassPlus,
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            NavTab(
              label: 'Add',
              selectedicon: FontAwesomeIcons.squarePlus,
              icon: FontAwesomeIcons.plus,
              isSelected: _selectedIndex == 2,
              onTap: () => _onTap(2),
            ),
            NavTab(
              label: 'Inbox',
              selectedicon: FontAwesomeIcons.solidMessage,
              icon: FontAwesomeIcons.message,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTab(
              label: 'Profile',
              selectedicon: FontAwesomeIcons.solidUser,
              icon: FontAwesomeIcons.user,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
