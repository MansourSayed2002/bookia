import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/cart/data/model/cart_model/cart_item.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/widget/card_item_widegt.dart';
import 'package:bookia/feature/cart/presentation/widget/custom_cart_check_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TextApp.mycart,
            style: TextstyleApp.black30W400.copyWith(fontSize: 24.0),
          ),
        ),
        body: CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          var cubit = context.read<CartCubit>();
          List<CartItem> cartItems = cubit.cartModel?.data?.cartItems ?? [];
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: cartItems.length,
                  separatorBuilder: (context, index) => Gap(10.0),
                  itemBuilder:
                      (context, index) => CardItemWidegt(
                        cartItems: cartItems[index],
                        onDelete: () {
                          cubit.deleteCart(cartItems[index].itemId.toString());
                        },
                        onRemove: () {
                          if (cartItems[index].itemQuantity! > 1) {
                            cubit.updateCart(
                              cartItems[index].itemId,
                              cartItems[index].itemQuantity! - 1,
                            );
                          }
                        },
                        onAdd: () {
                          if (cartItems[index].itemQuantity! <
                              cartItems[index].itemProductStock!) {
                            cubit.updateCart(
                              cartItems[index].itemId,
                              cartItems[index].itemQuantity! + 1,
                            );
                          }
                        },
                      ),
                ),
              ),
              CustomCartCheckOrder(
                total: cubit.cartModel?.data?.total.toString() ?? "",
                oncheckout: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
