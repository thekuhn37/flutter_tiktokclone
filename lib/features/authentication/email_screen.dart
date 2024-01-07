import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/password_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(
      () {
        setState(() {
          _email = _emailController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Not valid.";
    }
    return null;
    //_email에 있는 스트링 값이 정규표현식 상 기준에 부합되지 않는(!)경우
    //Return "Not Valid".  If that is not the case, just return 'null'.
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
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
                  'What is your email?',
                  style: TextStyle(
                    fontSize: Sizes.size20 + Sizes.size2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v16,
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmit,
                  autocorrect: false,
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  decoration: InputDecoration(
                    hintText: "Email",
                    errorText: _isEmailValid(),
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
                Gaps.v24,
                GestureDetector(
                  // onTap: _onSubmit,
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: _email.isEmpty || _isEmailValid() != null,
                    // FormButton must be disabled when _email is empty
                    // or _isEmailValid is not null.
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
