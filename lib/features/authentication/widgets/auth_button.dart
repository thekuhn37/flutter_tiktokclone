import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;

  const AuthButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 부모 위젯의 크기에 비례해서 커지는 Box.
      // widthFactor : 그 부모 위젯의 크기에 몇 배로 비례할 것인지를 지정
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey.shade300,
          width: Sizes.size1,
        )),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size14,
          ),
        ),
      ),
    );
  }
}
