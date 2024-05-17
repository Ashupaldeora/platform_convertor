import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/components/material_appBar.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveScaffold extends StatelessWidget {
  AdaptiveScaffold({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<SwitchProvider>(context);
    final providerFalse = Provider.of<SwitchProvider>(context, listen: false);
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? DefaultTabController(
            length: 4,
            child: Scaffold(
              body: body,
              appBar: appBar(providerTrue, providerFalse),
            ),
          )
        : CupertinoPageScaffold(
            child: body,
            navigationBar: CupertinoNavigationBar(
              border: null,
              backgroundColor: CupertinoColors.systemGrey6,
              middle: Text("Platform Convertor"),
              trailing: CupertinoSwitch(
                onChanged: (value) {
                  providerFalse.changePlatform(value);
                },
                value: providerTrue.isAndroid,
              ),
            ),
          );
  }
}