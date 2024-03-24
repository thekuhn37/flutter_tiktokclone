import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/features/authentication/username_screen.dart';
import 'package:tiktokclone/features/authentication/login_screen.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/widgets/auth_button.dart';
import 'package:tiktokclone/features/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

//  private 한 method의 이름 맨 앞에는 '_'를 붙여주자.
// state lifecycle 관련된 method 앞에는 '_' 안붙여준다. ex.Build
  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size40,
                ),
                child: Column(
                  children: [
                    Gaps.v80,
                    const Text(
                      'Sign up for TikTok',
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w700,
                      ),
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .headlineSmall!
                      //     .copyWith(
                      //         color: isDarkMode(context)
                      //             ? Colors.amber
                      //             : Colors.teal),
                    ),
                    Gaps.v20,
                    const Opacity(
                      opacity: 0.7,
                      child: Text(
                        'Create a profile, follow other accounts, make your own videos, and more.',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          // color: isDarkMode(context)
                          //     ? Colors.grey.shade300
                          //     : Colors.black45,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v40,
                    if (orientation == Orientation.portrait)
                      // use 'Collection if'
                      ...[
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.user),
                        text: 'Use email or password',
                        onTapFunction: _onEmailTap,
                      ),
                      Gaps.v12,
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        text: 'Continue with Facebook',
                        onTapFunction: (context) {},
                      ),
                      Gaps.v12,
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.apple),
                        text: 'Continue with Apple',
                        onTapFunction: (context) {},
                      ),
                      Gaps.v12,
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.google),
                        text: 'Continue with Google',
                        onTapFunction: (context) {},
                      ),
                      Gaps.v12,
                    ],
                    if (orientation == Orientation.landscape) ...[
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.user),
                        text: 'Use email or password',
                        onTapFunction: _onEmailTap,
                      ),
                      Gaps.v12,
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        text: 'Continue with Facebook',
                        onTapFunction: (context) {},
                      ),
                      Gaps.v12,
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.apple),
                        text: 'Continue with Apple',
                        onTapFunction: (context) {},
                      ),
                      Gaps.v12,
                      AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.google),
                        text: 'Continue with Google',
                        onTapFunction: (context) {},
                      ),
                      Gaps.v12,
                    ],
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Expanded(
                    //           child: AuthButton(
                    //             icon: const FaIcon(FontAwesomeIcons.user),
                    //             text: 'Use email or password',
                    //             onTapFunction: _onEmailTap,
                    //           ),
                    //         ),
                    //         Gaps.h12,
                    //         Expanded(
                    //           child: AuthButton(
                    //             icon: const FaIcon(FontAwesomeIcons.facebook),
                    //             text: 'Continue with Facebook',
                    //             onTapFunction: (context) {},
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     Gaps.v16,
                    //     Row(
                    //       children: [
                    //         Expanded(
                    //           child: AuthButton(
                    //             icon: const FaIcon(FontAwesomeIcons.apple),
                    //             text: 'Continue with Apple',
                    //             onTapFunction: (context) {},
                    //           ),
                    //         ),
                    //         Gaps.h12,
                    //         Expanded(
                    //           child: AuthButton(
                    //             icon: const FaIcon(FontAwesomeIcons.google),
                    //             text: 'Continue with Google',
                    //             onTapFunction: (context) {},
                    //           ),
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 1,
            // color: Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
