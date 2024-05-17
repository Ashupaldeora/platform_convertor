import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/adaptive%20widgets/adaptive_app.dart';
import 'package:platform_convertor/adaptive%20widgets/adaptive_appbar.dart';
import 'package:platform_convertor/adaptive%20widgets/adaptive_scaffold.dart';
import 'package:platform_convertor/utils/global%20provider/switch_provider.dart';
import 'package:provider/provider.dart';

import '../../adaptive widgets/adaptive_tab_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveApp(scaffold: AdaptiveScaffold(body: AdaptiveTabBar()));
  }
}
