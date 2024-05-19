import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/utils/global%20provider/switch_provider.dart';
import 'package:provider/provider.dart';

import '../screens/settings_screen/providers/settings_provider.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key, required this.scaffold});

  final Widget scaffold;
  @override
  Widget build(BuildContext context) {
    final profileProvidertrue =
        Provider.of<ProfileProvider>(context, listen: true);
    return (!Provider.of<SwitchProvider>(context).isAndroid)
        ? CupertinoApp(
            theme: !profileProvidertrue.isdark
                ? CupertinoThemeData(brightness: Brightness.light)
                : CupertinoThemeData(
                    brightness: Brightness.dark,
                    textTheme: CupertinoTextThemeData(
                        textStyle: TextStyle(color: CupertinoColors.white))),
            home: scaffold,
            debugShowCheckedModeBanner: false,
          )
        : MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark().copyWith(
                textTheme:
                    TextTheme(bodySmall: TextStyle(color: Colors.white))),
            themeMode:
                !profileProvidertrue.isdark ? ThemeMode.light : ThemeMode.dark,
            home: scaffold,
            debugShowCheckedModeBanner: false,
          );
  }
}
