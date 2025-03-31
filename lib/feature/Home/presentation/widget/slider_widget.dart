import 'package:bookia/feature/Home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bookia/core/theme/color_app.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: cubit.slidersModel?.data?.sliders?.length ?? 0,
              itemBuilder:
                  (context, index, realIndex) => ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          cubit.slidersModel?.data?.sliders?[index].image ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                viewportFraction: .9,
                enlargeCenterPage: true,
                reverse: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    cubit.currentindex = index;
                  });
                },
              ),
            ),
            Gap(14.0),
            SmoothPageIndicator(
              controller: PageController(initialPage: cubit.currentindex),
              axisDirection: Axis.horizontal,
              count: cubit.slidersModel?.data?.sliders?.length ?? 0,
              effect: ExpandingDotsEffect(
                activeDotColor: ColorApp.primery,
                dotHeight: 7.0,
                dotWidth: 7.0,
                dotColor: ColorApp.grey,
                spacing: 5.0,
                expansionFactor: 4.0,
              ),
            ),
          ],
        );
      },
    );
  }
}
