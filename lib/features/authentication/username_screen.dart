import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/email_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
//controller는 특정 위젯에 대하여 조작해 줄 수 있게 만들어주는 오브젝트를 만들어준다.
//UsernameScreen을 stateful widget으로 만들고 state class 안에다가 controller를 정의해준다.

  String _username = "";

  // event listener를 추가해서 반응을 들을 수 있게 해야하고, initstate안에 쓴다.
  @override
  void initState() {
    super.initState();
    // super.initState가 먼저 온다.
    _usernameController.addListener(
      () {
        // print(_usernameControll er.text);
        setState(() {
          _username = _usernameController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
    // super.dispose()는 모든 것의 마지막에 온다.
  }

  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }
/*
다른 화면에서는 페이지 이동하는 메서드를 만들 때, 항상 context를 받게끔 했다. 
ex. login_screen의 _onSignUpTap 매서드.
하지만 여기서 _onNextTap은 context를 받게하지 않아도된다. 그 이유는 
Statefulwidget의 State 위젯 내에서는 항상 context가 available 하기 때문.
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.amber,
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
              'Create username',
              style: TextStyle(
                fontSize: Sizes.size20 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v10,
            const Text(
              'You can always change this later.',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
            ),
            Gaps.v16,
            TextField(
              // textfield에 대한 controller를 입력한다.
              controller: _usernameController,
              cursorColor: Theme.of(context).colorScheme.onPrimary,
              decoration: InputDecoration(
                hintText: "Username",
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
              onTap: _onNextTap,
              child: FormButton(
                disabled: _username.isEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
