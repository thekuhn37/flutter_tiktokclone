import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/utils.dart';

class PostVideoButton extends StatelessWidget {
  final bool onTapDown;
  final bool inverted;

  const PostVideoButton({
    super.key,
    required this.onTapDown,
    required this.inverted,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    Color containerColor;
    if (onTapDown) {
      containerColor =
          Colors.grey.shade500; // Set color to grey when onTapDown is true
    } else {
      containerColor = inverted || isDark
          ? Colors.white
          : Colors
              .black; // Set color to black when inverted is true, otherwise white
    }

    Color iconColor;
    if (onTapDown) {
      iconColor = Colors.white; // Set color to grey when onTapDown is true
    } else {
      iconColor = inverted || isDark
          ? Colors.black
          : Colors
              .white; // Set color to black when inverted is true, otherwise white
    }

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
            color: containerColor,
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
          ),
          duration: const Duration(milliseconds: 400),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: iconColor,
              size: Sizes.size20,
            ),
          ),
        )
      ],
    );
  }
}
