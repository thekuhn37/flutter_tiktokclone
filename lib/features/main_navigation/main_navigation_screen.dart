import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Cart'),
    ),
    const Center(
      child: Text('Account'),
    ),
    const Center(
      child: Text('Share'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // To make a cupertino style navigation bar, we should replace
      // 'scaffold' to 'cupertinotabscaffold'.
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(CupertinoIcons.search),
            label: "Search",
          ),
        ],
      ),
      // Use CupertinoTapBar.
      tabBuilder: (context, index) => screens[index],
      // tabbuilder is a function that returns widgets.
    );
  }
}
