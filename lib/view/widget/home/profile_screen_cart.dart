import 'package:bea_shop/core/style/text_style.dart';
import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';

class ProfileScreenCart extends StatelessWidget {
  final Widget leading;
  final String title;
  final void Function() onTap;

  const ProfileScreenCart(
      {super.key,
      required this.leading,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        leading: leading,
        title: Text(title,
            style: AppTextStyleData.googleAraPey(
                fontSize: 18, color: AppColor.black54)),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 20,
        ),
        onTap: onTap,
      ),
    );
  }
}
