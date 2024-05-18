import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/global provider/switch_provider.dart';

class AdaptiveSaveButton extends StatelessWidget {
  const AdaptiveSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? OutlinedButton(onPressed: () {}, child: Text("Save"))
        : CupertinoButton(
            child: Container(
                height: 45,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Save",
                  style: TextStyle(color: CupertinoColors.white),
                )),
            onPressed: () {},
          );
  }
}
