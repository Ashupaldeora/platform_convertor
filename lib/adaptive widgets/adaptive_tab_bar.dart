import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/person_add_tab/view/person_add_screen.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveTabBar extends StatelessWidget {
  const AdaptiveTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? TabBarView(children: [
            PersonAddTab(),
          ])
        : CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                  label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone), label: "Calls"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: "Settings"),
            ]),
            tabBuilder: (context, index) => Text("hi"),
          );
  }
}
