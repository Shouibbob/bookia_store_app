import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.width,
    this.height,
    this.hintText,
    this.suffixIcon,
  });
  final double? width;
  final double? height;
  final String? hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText ?? 'Enter your Email',
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
