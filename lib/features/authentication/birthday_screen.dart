import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';
import 'package:tiktokclone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate =
      DateTime.now().subtract(const Duration(days: 365 * 12));
  // String _birthday = "";

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
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
              'When is your birthday?',
              style: TextStyle(
                fontSize: Sizes.size20 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v10,
            const Text(
              "Your birthday won't be shown pulicly",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              // 일단 유저가 아무것도 입력하지 못하게 막음.
              controller: _birthdayController,
              cursorColor: Theme.of(context).colorScheme.onPrimary,
              decoration: InputDecoration(
                // hintText: "Birthday",
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
              child: const FormButton(
                disabled: false,
                text: 'Next',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        // bottomappbar 자체를 감싸야 커졌다.
        height: 300,
        child: BottomAppBar(
          surfaceTintColor: Colors.white,
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
