import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/Home/presentation/screen/search_product_screen.dart';
import 'package:bookia/feature/Home/presentation/widget/best_seller_widget.dart';
import 'package:bookia/feature/Home/presentation/widget/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(ImageApp.logo, height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconApp.notification, height: 24.0),
          ),
          IconButton(
            onPressed: () {
              context.push(SearchProductScreen());
            },
            icon: SvgPicture.asset(IconApp.search, height: 24.0),
          ),
        ],
      ),
      body: BlocProvider.value(
        value: HomeCubit()..getAllData(),
        child: CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return ListView(
            children: [
              SliderWidget(),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextApp.bestseller,
                      style: TextstyleApp.black15W400.copyWith(fontSize: 24.0),
                    ),
                    Gap(15.0),
                    BestSellerWidget(),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(child: Lottie.asset(ImageApp.loading));
        }
      },
    );
  }
}
