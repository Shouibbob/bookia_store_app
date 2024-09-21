import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_store_app/feature/home/presentation/page/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerBooksWidget extends StatefulWidget {
  const BestSellerBooksWidget({
    super.key,
  });

  @override
  State<BestSellerBooksWidget> createState() => _BestSellerBooksWidgetState();
}

class _BestSellerBooksWidgetState extends State<BestSellerBooksWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetBestellerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is BestSellerLoadedState ||
            current is BestSellerLoadingState,
        builder: (context, state) {
          if (state is BestSellerLoadedState) {
            var books = context.read<HomeBloc>().bestSellerResponseModel?.data;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: books?.products?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    push(
                        context,
                        BookDetailsView(
                          product: books?.products?[index],
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Hero(
                          tag: books?.products?[index].id ?? '',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: books?.products?[index].image ?? '',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        )),
                        const Gap(8),
                        Text(books?.products?[index].name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBodyTextStyle(context)),
                        const Gap(8),
                        Row(
                          children: [
                            Text(
                              '\$${books?.products?[index].price ?? ''}',
                              style: getBodyTextStyle(context),
                            ),
                            const Spacer(),
                            CustomButton(
                              onPressed: () {},
                              color: AppColors.textColor,
                              text: 'Buy',
                              textStyle: getSmallTextStyle(
                                  fontSize: 14,
                                  context,
                                  color: AppColors.whiteColor),
                              width: 80,
                              height: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
