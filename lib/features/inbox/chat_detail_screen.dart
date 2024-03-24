import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/utils.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  late final TextEditingController _textEditingController;
  bool _isWriting = false;
  bool _isFieldtapped = false;

  @override
  void initState() {
    _isWriting = false;
    _isFieldtapped = false;
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onStartWriting() {
    setState(
      () {
        _isFieldtapped = true;
      },
    );
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
      _isFieldtapped = false;
    });
  }

  void _onTextChanged(String text) {
    setState(
      () {
        text.isNotEmpty ? _isWriting = true : _isWriting = false;
      },
    );
  }

  void _onTextSubmitted() {
    FocusScope.of(context).unfocus();
    print(_textEditingController.value);
    setState(
      () {
        _isWriting = false;
        _isFieldtapped = false;
        _textEditingController.clear();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return GestureDetector(
      onTap: _stopWriting,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: Sizes.size8,
            leading: Stack(
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/107166856?s=96&v=4"),
                  child: Text('DH'),
                ),
                Positioned(
                  bottom: 0,
                  left: Sizes.size32,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 44, 242, 50),
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size10),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: Sizes.size5,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              "GonRe",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text("Active now"),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
                Gaps.h32,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                // not => but {} : why? we want to put a variable in front of the
                // container
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(Sizes.size20),
                          topRight: const Radius.circular(Sizes.size20),
                          bottomLeft: Radius.circular(
                              isMine ? Sizes.size20 : Sizes.size2),
                          bottomRight: Radius.circular(
                              isMine ? Sizes.size5 : Sizes.size20),
                        ),
                        color: isMine
                            ? Colors.blue
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Text(
                        'This is a message.',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 20,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              // heigh,
              child: BottomAppBar(
                padding: const EdgeInsets.only(
                  top: Sizes.size14,
                  bottom: Sizes.size14,
                  left: Sizes.size16,
                ),
                elevation: 0,
                color: isDark ? Colors.black : Colors.grey.shade100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        onChanged: _onTextChanged,
                        onTap: _onStartWriting,
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        cursorColor: Theme.of(context).colorScheme.onPrimary,
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: Sizes.size1,
                            horizontal: Sizes.size10,
                          ),
                          isCollapsed: false,
                          hintText: "Send a message...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.size12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          // fillColor: Colors.white,
                          suffixIcon: _isFieldtapped
                              ? const Padding(
                                  padding: EdgeInsets.only(
                                    top: Sizes.size10,
                                    right: Sizes.size6,
                                  ),
                                  child: FaIcon(
                                    FontAwesomeIcons.faceLaugh,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    // if we don't set the width of the textfield, there is always
                    // an error. => In that case, wrap the textfield with Expanded.
                    Gaps.h10,
                    IconButton(
                      onPressed: _onTextSubmitted,
                      icon: Container(
                        padding: const EdgeInsets.all(Sizes.size6),
                        decoration: BoxDecoration(
                          color: _isWriting
                              ? Theme.of(context).colorScheme.onPrimary
                              : isDark
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade400,
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(Sizes.size20),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: isDark ? Colors.grey.shade400 : Colors.white,
                          size: Sizes.size20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
