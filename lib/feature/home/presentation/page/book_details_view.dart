import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/back_card_widget.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/home/data/models/response/best_seller_response_model/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const BackCardWidget(),
            const Spacer(),
            SvgPicture.asset('assets/icons/Bookmark.svg'),
            const Gap(8),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Row(
          children: [
            Text(
              '\$${product?.price}',
              style: getHeadLineTextStyle(context),
            ),
            const Gap(50),
            Expanded(
                child: CustomButton(
              text: 'Add to cart',
              onPressed: () {},
              color: AppColors.textColor,
            ))
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(30),
                Hero(
                  tag: product?.id ?? '',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: product?.image ?? '',
                      width: 180,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const Gap(16),
                Text(
                  product?.name ?? '',
                  style: getHeadLineTextStyle(context),
                ),
                const Gap(16),
                Text(
                  product?.category ?? '',
                  style:
                      getBodyTextStyle(context, color: AppColors.primaryColor),
                ),
                const Gap(16),
                Text(
                  product?.description ?? '',
                  textAlign: TextAlign.justify,
                  style: getBodyTextStyle(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
