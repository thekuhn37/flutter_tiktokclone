import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          stretch: true,
          // snap: true,
          pinned: true,
          backgroundColor: Colors.teal,
          collapsedHeight: 60,
          expandedHeight: 180,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            // I don't know why but without this padding, the text is not on center.
            stretchModes: const [
              StretchMode.blurBackground,
              // StretchMode.fadeTitle,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              "assets/images/placeholder.jpg",
              fit: BoxFit.cover,
            ),
            title: const Text('hello'),
          ),
        ),
        const SliverToBoxAdapter(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 40,
              )
            ],
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Container(
                color: Colors.teal[100 * (index % 9)],
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Item $index'),
                ),
              ),
            ),
            itemExtent: 100),
        SliverPersistentHeader(
          delegate: CustomDelegate(),
          pinned: true,
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Container(
                color: Colors.purple[100 * (index % 9)],
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Item $index'),
                ),
              ),
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: Sizes.size10,
              crossAxisSpacing: Sizes.size20,
              childAspectRatio: 1,
            ))
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  // it requires many required methods and getters. So use code action to make them
  // at one time.
  @override
  // this build method will return what our users will see.
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text(
            'Title!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      // it takes the largest space as much as possilbe at the parent's widget.
    );
  }

  @override
  double get maxExtent => 150;
  // like 'max Height'

  @override
  double get minExtent => 80;
  // like 'min Hieght

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // we will learn later when the return is true at DarkMode.
    return false;
  }
}
