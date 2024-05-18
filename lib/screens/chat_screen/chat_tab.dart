import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_convertor/adaptive%20widgets/adaptive_circle.dart';

import 'package:platform_convertor/screens/chat_screen/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ...List.generate(
              providerTrue.personData.length,
              (index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(providerTrue.personData[index].name.toString()),
                    subtitle: Text(providerTrue
                        .personData[index].chatConversation
                        .toString()),
                    leading: AdaptiveCircleAvatar(
                      radius: 35,
                      height: 50,
                      width: 50,
                    ),
                    onTap: () {},
                    trailing: Text(
                        "${providerTrue.personData[index].date!.day.toString() + "-" + providerTrue.personData[index].date!.month.toString() + "-" + providerTrue.personData[index].date!.year.toString()}, ${providerTrue.personData[index].timeOfDay!.hour.toString() + ":" + providerTrue.personData[index].timeOfDay!.minute.toString()}"),
                  ))
        ],
      ),
    );
  }
}
