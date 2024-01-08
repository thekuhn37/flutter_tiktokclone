import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/birthday_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;
  // this variable is not 'final'/

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(
      () {
        setState(() {
          _password = _passwordController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty &&
        _password.length > 8 &&
        _password.length < 20;
    // _password가 빈 값이 아니라면 _password.isNotEmpty 는 true.
    //  && : and
  }

/* 원래 틱톡 화면대로 구현 시. 
    String? _isPasswordValid() {
    if (_password.isEmpty) return null;
    final regExp = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$");
    if (!regExp.hasMatch(_password)) {
      return "Not valid.";
    }
    return null;
    //_email에 있는 스트링 값이 정규표현식 상 기준에 부합되지 않는(!)경우
    //Return "Not Valid".  If that is not the case, just return 'null'.
  }
*/

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    // _isPasswordValid가 boolean type이 되었으므로 null이 될리는 없다.
    if (!_isPasswordValid()) return;
    // if (_password.isEmpty || _isPasswordValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
    // controller의 장점 : 매서드로부터 먼 곳에서 이 컨트롤러를 매개로
    // 그 컨트롤러가 심어있는 메서드를 통제할 수 있다.
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;

    // 가독성 있게 쓴 코드를 풀어 쓴다면 아래와 같다.
    // if (_obscureText == true) {
    //   _obscureText = false;
    // } else {
    //   _obscureText = true;
    // }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      // onTap: _onScaffoldTap()로 하면 안되는 이유: void method 이므로.
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sign up",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v28,
                const Text(
                  'Create Password',
                  style: TextStyle(
                    fontSize: Sizes.size20 + Sizes.size2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v16,
                TextField(
                  controller: _passwordController,
                  // keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmit,
                  obscureText: _obscureText,
                  autocorrect: false,
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  decoration: InputDecoration(
                    suffix: Row(
                      // Row는 기본적으로 가질 수 있는 최대 너비를 가지려 한다.
                      // 따라서 너비를 제한 시에는 MainAxisSize를 제한한다.
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            size: Sizes.size20,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Gaps.h20,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: Sizes.size20,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    hintText: "Make it strong!",
                    // errorText: _isPasswordValid(),
                    // 원래 검증의 위치는 여기가 아니므로 삭제.
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                Gaps.v10,
                const Text(
                  'Your password must have:',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    FaIcon(
                      _isPasswordValid()
                          ? FontAwesomeIcons.circleCheck
                          : FontAwesomeIcons.circleXmark,
                      size: Sizes.size16,
                      color: _isPasswordValid()
                          ? Colors.green.shade600
                          : Colors.grey.shade600,
                    ),
                    Gaps.h5,
                    const Text(
                      '8 to 20 characters',
                      style: TextStyle(fontSize: Sizes.size12),
                    ),
                  ],
                ),
                // Gaps.v5,
                // Row(
                //   children: [
                //     FaIcon(
                //       FontAwesomeIcons.circleCheck,
                //       size: Sizes.size16,
                //       color: Colors.green.shade600,
                //     ),
                //     Gaps.h5,
                //     const Text(
                //       'Letters, numbers and special characters',
                //       style: TextStyle(fontSize: Sizes.size12),
                //     ),
                //   ],
                // ),
                Gaps.v28,
                GestureDetector(
                  // onTap: _onSubmit,
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: !_isPasswordValid(),
                    // _isPasswordValid가 true가 아닐 때 disabled 되어야.

                    // disabled: _password.isEmpty || _isPasswordValid() != null,
                    // FormButton must be disabled when _password is empty
                    // or _isPasswordValid is not null.
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
