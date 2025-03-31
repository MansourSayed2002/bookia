import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/widget/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: WishListCubit()..getWishList(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            TextApp.wishList,
            style: TextstyleApp.black30W400.copyWith(fontSize: 24.0),
          ),
        ),
        body: BlocBuilder<WishListCubit, WishListState>(
          builder: (context, state) {
            var cubit = context.read<WishListCubit>();
            if (state is WishListSuccess) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemCount: cubit.products.length,
                  separatorBuilder: (context, index) => Gap(10.0),
                  itemBuilder:
                      (context, index) => CardItem(
                        product: cubit.products[index],
                        onAddToCard: () {
                          cubit.addToCart(cubit.products[index].id.toString());
                        },
                        onDelete: () {
                          cubit.removefromWishList(
                            cubit.products[index].id.toString(),
                          );
                        },
                      ),
                ),
              );
            } else {
              return Center(child: Lottie.asset(ImageApp.loading));
            }
          },
        ),
      ),
    );
  }
}
