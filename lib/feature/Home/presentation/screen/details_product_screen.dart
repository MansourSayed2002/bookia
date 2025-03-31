import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/message_bar.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/Home/data/model/response/product/product.dart';
import 'package:bookia/feature/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/Home/presentation/widget/info_about_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DetailsProductrScreen extends StatelessWidget {
  const DetailsProductrScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddToWishListOrCartSuccess) {
            context.messageBar(state.message, ColorApp.primery);
          }
        },
        builder:
            (context, state) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: CustomButtonBackGlobal(),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<HomeCubit>().addToWishList(
                        product.id.toString(),
                      );
                    },
                    icon: SvgPicture.asset(IconApp.wishlist),
                  ),
                ],
              ),
              body: CustomBody(
                product: product,
                onAddToCard: () {
                  context.read<HomeCubit>().addToCart(product.id.toString());
                },
              ),
            ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.product,
    required this.onAddToCard,
  });
  final Product product;
  final Function() onAddToCard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          Expanded(child: InfoAboutProduct(product: product)),
          Row(
            children: [
              Text(
                product.price.toString(),
                style: TextstyleApp.black30W400.copyWith(fontSize: 24.0),
              ),
              Gap(45.0),
              Expanded(
                child: CustomElevatedButtonGlobal(
                  onatp: onAddToCard,
                  backgroundcolor: ColorApp.dark,
                  title: TextApp.addToCard,
                  style: TextstyleApp.black15W400.copyWith(
                    color: ColorApp.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
