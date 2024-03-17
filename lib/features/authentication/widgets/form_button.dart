import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/utils.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final String text;
  // disabled라는 boolean 변수만 받으면 된다.

  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
    // 자동으로 code action 하였을 시 : required String username,
  });
  // 자동으로 code action 하였을 시 : _username = username;
  // named parameter는 '_'로 시작할 수 없기 때문에 username을 선언한 뒤
  // _username으로 할당하게 된다. 하지만 이는 위와 같이 변경해준다.

  // final String _username;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color: disabled
              ? isDarkMode(context)
                  ? Colors.grey.shade800
                  : Colors.grey.shade200
              : Theme.of(context).colorScheme.onPrimary,
        ),
        duration: const Duration(milliseconds: 300),
        // AnimateContainer는 컨테이너만 애니메이션 효과를 준다.
        // 즉 Text의 애니매이션은 따로 효과를 줘야 한다.
        // 'AnimatedDefaultTextStyle을 사용!
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.shade500 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
