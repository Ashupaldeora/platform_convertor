import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_convertor/adaptive%20widgets/adaptive_circle.dart';

import 'package:platform_convertor/screens/chat_screen/providers/chat_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/global provider/switch_provider.dart';
import '../person_add_tab/providers/person_add_provider.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ...List.generate(
              providerTrue.personData.length,
              (index) => AdaptiveListTile(
                    index: index,
                  ))
        ],
      ),
    );
  }
}

class AdaptiveListTile extends StatelessWidget {
  const AdaptiveListTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);

    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(providerTrue.personData[index].name.toString()),
              subtitle: Text(
                  providerTrue.personData[index].chatConversation.toString()),
              leading: AdaptiveCircleAvatar(
                radius: 35,
                height: 50,
                width: 50,
              ),
              onTap: () {},
              trailing: Text(
                  "${providerTrue.personData[index].date!.day.toString() + "-" + providerTrue.personData[index].date!.month.toString() + "-" + providerTrue.personData[index].date!.year.toString()}, ${providerTrue.personData[index].timeOfDay!.hour.toString() + ":" + providerTrue.personData[index].timeOfDay!.minute.toString()}"),
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: CupertinoListTile(
              leadingSize: 50,
              title: Text(providerTrue.personData[index].name.toString()),
              subtitle: Text(
                  providerTrue.personData[index].chatConversation.toString()),
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        Provider.of<PersonAddProvider>(context).imgpath != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                    Provider.of<PersonAddProvider>(context)
                                        .imgpath!))
                            : null),
              ),
              trailing: Text(
                  "${providerTrue.personData[index].date!.day.toString() + "-" + providerTrue.personData[index].date!.month.toString() + "-" + providerTrue.personData[index].date!.year.toString()}, ${providerTrue.personData[index].timeOfDay!.hour.toString() + ":" + providerTrue.personData[index].timeOfDay!.minute.toString()}"),
              onTap: () {},
            ),
          );
  }
}
// AdaptiveCircleAvatar(
// radius: 35,
// height: 30,
// width: 30,
// ),
