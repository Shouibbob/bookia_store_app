import 'package:bookia_store_app/core/function/dialogs.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/home/presentation/page/cart/checkout.dart';
import 'package:bookia_store_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: getTitleTextStyle(context),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is RemoveFromCartLoadedState ||
                state is UpdateCartLoadedState) {
              Navigator.pop(context);
              context.read<HomeBloc>().add(GetCartEvent());
            } else if (state is CheckoutLoadedState) {
              //Navigator.pop(context);
              push(context, const CheckoutView());
            } else if (state is RemoveFromCartLoadingState ||
                state is GetCartLoadingState) {
              showLoadingDialog(context);
            } else if (state is UpdateCartLoadingState) {
              showLoadingDialog(context);
            } else if (state is GetCartLoadedState) {
              Navigator.pop(context);
            } else if (state is HomeErrorState) {
              Navigator.pop(context);
            }
          },
          buildWhen: (previous, current) => current is GetCartLoadedState,
          builder: (context, state) {
            var cartList =
                context.read<HomeBloc>().getCartResponseModel?.data?.cartItems;
            int quantity = 0;

            if (cartList?.isEmpty ?? false) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.hourglass_empty_rounded,
                      size: 100,
                      color: AppColors.primaryColor,
                    ),
                    const Gap(20),
                    Text(
                      'No Books in wishlist',
                      style: getBodyTextStyle(context),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    cartList?[index].itemProductImage ?? '',
                                width: 100,
                                height: 110,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          cartList?[index].itemProductName ??
                                              '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: getBodyTextStyle(context),
                                        )),
                                        IconButton.outlined(
                                            constraints: const BoxConstraints(
                                              maxHeight: 24,
                                              maxWidth: 24,
                                            ),
                                            padding: const EdgeInsets.all(3),
                                            onPressed: () {
                                              context.read<HomeBloc>().add(
                                                  RemoveFromCartEvent(
                                                      cartItemId:
                                                          cartList?[index]
                                                                  .itemId ??
                                                              0));
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              size: 16,
                                            ))
                                      ],
                                    ),
                                    Text(
                                      "\$${cartList?[index].itemTotal?.toStringAsFixed(2)}",
                                      style: getBodyTextStyle(context,
                                          fontSize: 16),
                                    ),
                                    const Gap(10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        FloatingActionButton.small(
                                          heroTag: 'btn1',
                                          backgroundColor:
                                              AppColors.borderColor,
                                          elevation: 0,
                                          onPressed: () {
                                            quantity =
                                                cartList?[index].itemQuantity ??
                                                    1;
                                            setState(() {
                                              if (quantity > 0) {
                                                quantity--;
                                              }
                                              // else if (quantity == 0) {
                                              //   context.read<HomeBloc>().add(
                                              //       RemoveFromCartEvent(
                                              //           cartItemId:
                                              //               cartList?[index].itemId ??
                                              //                   0));
                                              // }
                                            });
                                            if (quantity > 0) {
                                              context.read<HomeBloc>().add(
                                                  UpdateCartEvent(
                                                      cartItemId:
                                                          cartList?[index]
                                                                  .itemId ??
                                                              0,
                                                      quantity: quantity));
                                            } else if (quantity == 0) {
                                              context.read<HomeBloc>().add(
                                                  RemoveFromCartEvent(
                                                      cartItemId:
                                                          cartList?[index]
                                                                  .itemId ??
                                                              0));
                                            }
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                        const Gap(10),
                                        Text(
                                          cartList?[index]
                                                  .itemQuantity
                                                  .toString() ??
                                              quantity.toString(),
                                          style: getBodyTextStyle(context),
                                        ),
                                        const Gap(10),
                                        FloatingActionButton.small(
                                          heroTag: 'btn2',
                                          backgroundColor:
                                              AppColors.borderColor,
                                          elevation: 0,
                                          onPressed: () {
                                            int itemProductStock =
                                                cartList?[index]
                                                        .itemProductStock ??
                                                    0;
                                            quantity =
                                                cartList?[index].itemQuantity ??
                                                    1;
                                            setState(() {
                                              quantity++;
                                            });
                                            if (quantity <= itemProductStock) {
                                              context.read<HomeBloc>().add(
                                                  UpdateCartEvent(
                                                      cartItemId:
                                                          cartList?[index]
                                                                  .itemId ??
                                                              0,
                                                      quantity: quantity));
                                            } else {
                                              showErrorDialog(
                                                  context, 'Out of Stock');
                                            }
                                          },
                                          child: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Divider(),
                        );
                      },
                      itemCount: cartList?.length ?? 0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: getBodyTextStyle(
                          context,
                          fontSize: 20,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text(
                        context
                                .read<HomeBloc>()
                                .getCartResponseModel
                                ?.data
                                ?.total ??
                            '\$ 95.00',
                        style: getBodyTextStyle(
                          context,
                          fontSize: 20,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(19),
                  CustomButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(CheckoutEvent());
                    },
                    text: 'Checkout',
                    textStyle: getBodyTextStyle(
                      context,
                      fontSize: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
