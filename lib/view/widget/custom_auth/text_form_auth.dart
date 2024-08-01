import 'package:flutter/material.dart';
import '../../../core/style/text_style.dart';

class TextFormAuth extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final TextInputType keyboardType;
  final Function(String) onFiledSubmit;
  final void Function()? onTap;

  final String label;
  final String hint;
  final String val;
  final Widget icon;
  final bool obscure;
  final Color color;
  final Color colorLabel;
  final int mine;
  final double r;
  final double l;
  final double v;
  final double h;

  const TextFormAuth({
    super.key,
    required this.controller,
    required this.formKey,
    required this.label,
    required this.hint,
    required this.val,
    required this.icon,
    required this.onFiledSubmit,
    required this.obscure,
    required this.color,
    required this.keyboardType,
    this.mine = 7,
    this.r = 16,
    this.l = 16,
    this.v = 16,
    this.h = 30,
    this.colorLabel = Colors.blue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(r, 0, l, 0),
      child: Form(
        key: formKey,
        child: TextFormField(
            onTap: onTap,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            obscureText: obscure,
            maxLines: 1,
            controller: controller,
            keyboardType: keyboardType,
            textAlign: TextAlign.start,
            style: TextStyle(color: color, fontSize: 14),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  EdgeInsets.symmetric(vertical: v, horizontal: h),
              labelText: label,
              hintText: hint,
              hintStyle: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              labelStyle: AppTextStyleData.googleRobotoSlab(
                  color: colorLabel, fontSize: 16),
              suffixIcon: icon,
              enabled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: Colors.black, width: 2)),
            ),
            validator: (String? value) {
              if (value == null ||
                  value.isEmpty ||
                  value.length < mine) {
                return val;
              }
              return null;
            },
            onFieldSubmitted: onFiledSubmit),
      ),
    );
  }
}
