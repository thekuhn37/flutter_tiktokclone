import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  final bool onTapDown;

  const PostVideoButton({
    super.key,
    required this.onTapDown,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 30,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            height: 40,
            width: 25,
            decoration: BoxDecoration(
                color:
                    onTapDown ? Colors.blue.shade900 : const Color(0xFF68CCE2),
                borderRadius: BorderRadius.circular(Sizes.size10)),
          ),
        ),
        Positioned(
          left: 30,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            height: 40,
            width: 25,
            decoration: BoxDecoration(
                color:
                    onTapDown ? Colors.red.shade900 : const Color(0xFFE6456E),
                borderRadius: BorderRadius.circular(Sizes.size10)),
          ),
        ),
        AnimatedContainer(
          height: 40,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          decoration: BoxDecoration(
            color: onTapDown ? Colors.grey.shade500 : Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
          ),
          duration: const Duration(milliseconds: 400),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: onTapDown ? Colors.white : Colors.black,
              size: Sizes.size20,
            ),
          ),
        )
      ],
    );
  }
}
