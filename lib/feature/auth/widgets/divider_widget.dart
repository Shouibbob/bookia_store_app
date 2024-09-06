import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DividerView extends StatelessWidget {
  const DividerView({
    super.key,
    this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        const Gap(10),
        Text(
          text ?? 'Or Login with',
          style: getBodyTextStyle(),
        ),
        const Gap(10),
        const Expanded(child: Divider()),
      ],
    );
  }
}
