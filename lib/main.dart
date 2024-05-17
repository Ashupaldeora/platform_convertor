import 'package:flutter/material.dart';
import 'package:platform_convertor/adaptive%20widgets/adaptive_scaffold.dart';
import 'package:platform_convertor/screens/main_screen/main_screen.dart';
import 'package:platform_convertor/utils/global%20provider/switch_provider.dart';
import 'package:provider/provider.dart';

import 'adaptive widgets/adaptive_app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SwitchProvider(),
    ),
  ], builder: (context, child) => PlatformConvertor()));
}

class PlatformConvertor extends StatelessWidget {
  const PlatformConvertor({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}