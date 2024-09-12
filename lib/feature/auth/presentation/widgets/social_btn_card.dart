import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/social_card_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialButtonsCard extends StatelessWidget {
  const SocialButtonsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialCardItem(
          logo: AssetsIcons.facebookSvg,
        ),
        Gap(8),
        SocialCardItem(
          logo: AssetsIcons.googleSvg,
        ),
        Gap(8),
        SocialCardItem(
          logo: AssetsIcons.appleSvg,
        ),
      ],
    );
  }
}
