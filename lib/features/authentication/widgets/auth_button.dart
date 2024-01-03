import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  // final String sendpost;
  final FaIcon icon;
  final void Function(BuildContext) onTapFunction;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapFunction(context),
      child: FractionallySizedBox(
        // 부모 위젯의 크기에 비례해서 커지는 Box.
        // widthFactor : 그 부모 위젯의 크기에 몇 배로 비례할 것인지를 지정
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 18,
          ),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          )),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                  // stack내에 하나의 위젯만 배열을 바꾸는 위젯
                  alignment: Alignment.centerLeft,
                  child: icon),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
