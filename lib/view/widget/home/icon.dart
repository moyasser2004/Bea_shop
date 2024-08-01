import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';

class IconWidget extends StatelessWidget {

  final void Function() onPress;
  final IconData icon;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final Color? color;

  const IconWidget(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.top,
      required this.left,
      required this.right,
      required this.bottom,
        this.color=Colors.black
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      child: IconButton(
        splashColor: AppColor.grey400,
        splashRadius: 20,
        onPressed: onPress,
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
