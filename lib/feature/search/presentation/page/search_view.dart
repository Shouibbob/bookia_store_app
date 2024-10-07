import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/home/presentation/page/bookdetails/book_details_view.dart';
import 'package:bookia_store_app/feature/search/presentation/bloc/search_bloc.dart';
import 'package:bookia_store_app/feature/search/presentation/bloc/search_event.dart';
import 'package:bookia_store_app/feature/search/presentation/bloc/search_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Search'),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return Column(
              children: [
                const Gap(50),
                // TextFormFieldWidget(
                //   controller: searchController,
                //   hintText: 'Search',
                //   suffixIcon: IconButton(
                //     onPressed: () {
                //       context.read<SearchBloc>().add(SearchProductEvent(
                //           searchName: searchController.text));
                //     },
                //     icon: SvgPicture.asset(AssetsIcons.searchSvg),
                //   ),
                // ),
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<SearchBloc>().add(SearchProductEvent(
                            searchName: searchController.text));
                      },
                      icon: SvgPicture.asset(AssetsIcons.searchSvg),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    //shrinkWrap: true,
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: context
                            .read<SearchBloc>()
                            .searchResponseModel
                            ?.data
                            ?.products
                            ?.length ??
                        0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                product: context
                                    .read<SearchBloc>()
                                    .searchResponseModel
                                    ?.data
                                    ?.products?[index],
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
                                tag: context
                                        .read<SearchBloc>()
                                        .searchResponseModel
                                        ?.data
                                        ?.products?[index]
                                        .id ??
                                    '',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: context
                                            .read<SearchBloc>()
                                            .searchResponseModel
                                            ?.data
                                            ?.products?[index]
                                            .image ??
                                        '',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              )),
                              const Gap(8),
                              Text(
                                  context
                                          .read<SearchBloc>()
                                          .searchResponseModel
                                          ?.data
                                          ?.products?[index]
                                          .name ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: getBodyTextStyle(context)),
                              const Gap(8),
                              Row(
                                children: [
                                  Text(
                                    context
                                            .read<SearchBloc>()
                                            .searchResponseModel
                                            ?.data
                                            ?.products?[index]
                                            .price ??
                                        '\$ 0.00',
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
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
