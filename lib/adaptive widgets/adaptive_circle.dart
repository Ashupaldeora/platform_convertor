import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/screens/person_add_tab/providers/person_add_provider.dart';
import 'package:provider/provider.dart';

import '../utils/global provider/switch_provider.dart';

class AdaptiveCircleAvatar extends StatelessWidget {
  AdaptiveCircleAvatar({super.key, this.radius = 60, this.height, this.width});
  double? radius, height, width;

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? InkWell(
            radius: radius,
            onTap: () {
              Provider.of<PersonAddProvider>(context, listen: false)
                  .pickImage();
            },
            child: CircleAvatar(
                radius: radius,
                child: Provider.of<PersonAddProvider>(context).imgpath == null
                    ? Icon(Icons.add_a_photo_outlined)
                    : null,
                backgroundImage:
                    Provider.of<PersonAddProvider>(context).imgpath == null
                        ? null
                        : FileImage(
                            Provider.of<PersonAddProvider>(context).imgpath!)),
          )
        : CupertinoButton(
            onPressed: () {
              Provider.of<PersonAddProvider>(context, listen: false)
                  .pickImage();
            },
            child: ClipOval(
              child: Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    image: DecorationImage(
                        image: FileImage(
                            Provider.of<PersonAddProvider>(context).imgpath!))),
                child: Provider.of<PersonAddProvider>(context).imgpath == null
                    ? Icon(
                        CupertinoIcons.camera,
                        color: CupertinoColors.white,
                      )
                    : null,
              ),
            ),
          );
  }
}
