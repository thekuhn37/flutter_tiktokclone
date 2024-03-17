import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/features/utils.dart';

class NavTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData selectedicon;
  final bool isSelected;
  final Function onTap;
  final int selectedindex;

  const NavTab({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectedicon,
    required this.selectedindex,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          //Container widget is added to make proper area to be clicked.
          color: selectedindex == 0 || isDark ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 100),
            child: Column(
              children: [
                FaIcon(
                  isSelected ? selectedicon : icon,
                  color: selectedindex == 0 || isDark
                      ? Colors.white
                      : Colors.black,
                ),
                Gaps.v5,
                Text(
                  label,
                  style: TextStyle(
                    color: selectedindex == 0 || isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
