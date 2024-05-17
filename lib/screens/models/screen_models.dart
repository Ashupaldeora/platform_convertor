import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/screens/person_add_tab/view/person_add_screen.dart';

class ScreenModels {
  final Widget screen;

  ScreenModels({required this.screen});
}

List<ScreenModels> screenList = [ScreenModels(screen: PersonAddTab())];
