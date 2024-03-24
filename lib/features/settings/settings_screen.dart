import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/breaktpoints.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  bool _switchturn = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  void _onSwitchTouched(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _switchturn = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale("es"),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Settings'),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: ListView(
              children: [
                SwitchListTile.adaptive(
                  value: _switchturn,
                  onChanged: _onSwitchTouched,
                  title: const Text('Enable notifications'),
                  subtitle:
                      const Text('The timely information will be delivered'),
                ),
                CheckboxListTile(
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  value: _notifications,
                  onChanged: _onNotificationsChanged,
                  title: const Text('Marketing Emails'),
                  subtitle:
                      const Text('Monthly newsletter will be sent to you'),
                ),
                ListTile(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2030),
                    );
                    if (kDebugMode) {
                      print(date);
                    }
                    if (!mounted) return;
                    final time = await showTimePicker(
                      // ignore: use_build_context_synchronously
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (kDebugMode) {
                      print(time);
                    }
                    if (!mounted) return;
                    final booking = await showDateRangePicker(
                      // ignore: use_build_context_synchronously
                      context: context,
                      barrierColor: Colors.teal,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            appBarTheme: const AppBarTheme(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (kDebugMode) {
                      print(booking);
                    }
                  },
                  title: const Text('What is your birthday?'),
                  subtitle: const Text('I need to know!'),
                ),
                ListTile(
                  title: const Text('Log out (iOS)'),
                  textColor: Colors.red,
                  onTap: () {
                    showCupertinoDialog(
                      //showCupertinoModalPopup :
                      //when the user click the outside of popup, it is dismissed.
                      // When you want the user must click the answer at the popup, use
                      // 'showCupertinoDialog'.
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text('We will wait for you'),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('No'),
                          ),
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            isDestructiveAction: true,
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Log out (Android)'),
                  textColor: Colors.red,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: const FaIcon(FontAwesomeIcons.faceSadCry),
                        title: const Text('Are you sure?'),
                        content: const Text('We will wait for you'),
                        actions: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const FaIcon(FontAwesomeIcons.ban),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Log out (iOS / Bottom)'),
                  textColor: Colors.red,
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: const Text('Are you sure?'),
                        message: const Text('Please don\'t go'),
                        actions: [
                          CupertinoActionSheetAction(
                            isDefaultAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Not log out'),
                          ),
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('log out'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  onTap: () => showAboutDialog(
                    context: context,
                    applicationVersion: "1.0.0",
                    applicationLegalese: "All rights reserved to Harry.D",
                  ),
                  title: const Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text("About this app ..."),
                ),
                // const AboutListTile()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
