import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../adaptive widgets/adaptive_circle.dart';
import '../../../utils/global provider/switch_provider.dart';

TextEditingController txtFullName = TextEditingController();
TextEditingController txtPhoneNumber = TextEditingController();
TextEditingController txtChatConversation = TextEditingController();

class PersonAddTab extends StatelessWidget {
  const PersonAddTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          AdaptiveCircleAvatar(),
          SizedBox(
            height: 30,
          ),
          AdaptiveTextField(
            controller: txtFullName,
            hintText: "Full Name",
            icon: (Provider.of<SwitchProvider>(context).isAndroid)
                ? Icon(Icons.person)
                : Icon(CupertinoIcons.person),
          ),
          AdaptiveTextField(
            controller: txtPhoneNumber,
            hintText: "Phone Number",
            icon: (Provider.of<SwitchProvider>(context).isAndroid)
                ? Icon(Icons.phone)
                : Icon(CupertinoIcons.phone),
          ),
          AdaptiveTextField(
            controller: txtChatConversation,
            hintText: "Chat Conversation",
            icon: (Provider.of<SwitchProvider>(context).isAndroid)
                ? Icon(Icons.chat)
                : Icon(CupertinoIcons.chat_bubble_text_fill),
          ),
        ],
      ),
    );
  }
}

class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon});

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: icon,
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1))),
            ),
          )
        : Row(
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  child: CupertinoTextField(
                    placeholder: hintText,
                    controller: controller,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: CupertinoColors.systemGrey, width: 1)),
                  ),
                ),
              ),
            ],
          );
  }
}
