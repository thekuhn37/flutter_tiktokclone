import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 5;

  List<Color> colors = [
    Colors.blue,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.purple,
  ];

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 5;
      colors.addAll([
        Colors.blue,
        Colors.teal,
        Colors.red,
        Colors.green,
        Colors.purple,
      ]);
      setState(() {});
    }
  }
  // .addAll : it adds the elements in a list to the list .addAll is called.

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // This dart page is rendered on the 'main_navigation_Screen' at which
      // the scaffold is already located. So there is no need to use scaffold here.
      // pageSnapping: true, (default value)
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            'Screen $index',
            style: const TextStyle(
              fontSize: Sizes.size32,
            ),
          ),
        ),
      ),
    );
  }
}
