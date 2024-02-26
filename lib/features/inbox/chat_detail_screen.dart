import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size5,
          leading: CircleAvatar(
            radius: Sizes.size24,
            foregroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/107166856?s=96&v=4"),
            child: Text('DH'),
          ),
          title: Text(
            "GonRe",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text("Active now"),
          trailing: Row(
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
            itemCount: 10,
          ),
          Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                elevation: 0,
                color: Colors.grey.shade50,
                child: Row(
                  children: [
                    const Expanded(child: TextField()),
                    // if we don't set the width of the textfield, there is always
                    // an error. => In that case, wrap the textfield with Expanded.
                    Gaps.h20,
                    Container(
                      child: const FaIcon(FontAwesomeIcons.paperPlane),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
