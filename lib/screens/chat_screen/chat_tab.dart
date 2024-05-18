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
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerTrue.personData.length,
            itemBuilder: (context, index) => ListTile(
              leading: AdaptiveCircleAvatar(
                radius: 20,
                height: 50,
                width: 50,
              ),
              title: Text(providerTrue.personData[index].name.toString()),
              subtitle: Text(
                  providerTrue.personData[index].chatConversation.toString()),
              trailing: Row(
                children: [
                  Text(
                      "${providerTrue.personData[index].date!.day.toString() + "-" + providerTrue.personData[index].date!.month.toString() + "-" + providerTrue.personData[index].date!.year.toString()}"),
                  Text(
                    "${providerTrue.personData[index].timeOfDay!.hour.toString() + ":" + providerTrue.personData[index].timeOfDay!.minute.toString()}",
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
