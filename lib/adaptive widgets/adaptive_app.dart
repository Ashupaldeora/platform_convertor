import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/utils/global%20provider/switch_provider.dart';
import 'package:provider/provider.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key, required this.scaffold});

  final Widget scaffold;
  @override
  Widget build(BuildContext context) {
    return (!Provider.of<SwitchProvider>(context).isAndroid)
        ? CupertinoApp(
            theme: CupertinoThemeData(brightness: Brightness.light),
            home: scaffold,
            debugShowCheckedModeBanner: false,
          )
        : MaterialApp(
            themeMode: ThemeMode.light,
            home: scaffold,
            debugShowCheckedModeBanner: false,
          );
  }
}
