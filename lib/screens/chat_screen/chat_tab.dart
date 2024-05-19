import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_convertor/adaptive%20widgets/adaptive_circle.dart';

import 'package:platform_convertor/screens/chat_screen/providers/chat_provider.dart';
import 'package:provider/provider.dart';

import '../../adaptive widgets/adaptive_ListTile.dart';
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

// AdaptiveCircleAvatar(
// radius: 35,
// height: 30,
// width: 30,
// ),
