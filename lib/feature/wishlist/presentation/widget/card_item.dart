import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/shared/net_work_image_widget.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/Home/data/model/response/product/product.dart';
import 'package:bookia/feature/wishlist/presentation/widget/buttom_add_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.product,
    required this.onAddToCard,
    required this.onDelete,
  });
  final Product product;
  final Function() onAddToCard;
  final Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NetWorkImageWidget(image: product.image, height: 118.0, width: 100.0),
        Gap(10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name.toString(),
                style: TextstyleApp.black18W400,
                maxLines: 2,
              ),
              Gap(10.0),
              Text(
                product.price.toString(),
                style: TextstyleApp.black15W400.copyWith(fontSize: 16.0),
              ),
              Gap(10.0),
              ButtomAddCard(onAddToCard: onAddToCard),
            ],
          ),
        ),
        InkWell(onTap: onDelete, child: SvgPicture.asset(IconApp.closed)),
      ],
    );
  }
}
