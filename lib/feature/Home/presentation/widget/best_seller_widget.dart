import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/net_work_image_widget.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/Home/data/model/response/product/product.dart';
import 'package:bookia/feature/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/Home/presentation/screen/details_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List bestseller = cubit.bestSellerModel?.data?.products ?? [];
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bestseller.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 11.0,
            crossAxisSpacing: 11.0,
            mainAxisExtent: 281.0,
          ),
          itemBuilder:
              (context, index) => CardProducts(product: bestseller[index]),
        );
      },
    );
  }
}

class CardProducts extends StatelessWidget {
  const CardProducts({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11.0),
      decoration: BoxDecoration(
        color: ColorApp.third,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.push(DetailsProductrScreen(product: product));
              },
              child: Hero(
                tag: product.id.toString(),

                child: NetWorkImageWidget(
                  image: product.image.toString(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            product.name.toString(),
            style: TextstyleApp.black18W400,
            maxLines: 2,
          ),
          Gap(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.price.toString(),
                style: TextstyleApp.black15W400.copyWith(fontSize: 16.0),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.dark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: Text(
                  TextApp.buy,
                  style: TextstyleApp.grey14W400.copyWith(
                    color: ColorApp.white,
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
