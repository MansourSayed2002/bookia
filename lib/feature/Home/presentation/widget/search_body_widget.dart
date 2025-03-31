import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/feature/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/Home/presentation/screen/details_product_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchBodyWidget extends StatelessWidget {
  const SearchBodyWidget({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: cubit.searchProductModel?.data?.products?.length ?? 0,
        separatorBuilder: (context, index) => Gap(10.0),
        itemBuilder: (BuildContext context, int index) {
          List book = cubit.searchProductModel?.data?.products ?? [];
          return InkWell(
            onTap: () {
              context.push(DetailsProductrScreen(product: book[index]));
            },
            child: ListTile(
              title: Text(book[index].name ?? ""),
              leading: CachedNetworkImage(
                imageUrl: book[index].image ?? "",
                width: 100,
              ),
            ),
          );
        },
      ),
    );
  }
}
