import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/shared/net_work_image_widget.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/cart/data/model/cart_model/cart_item.dart';
import 'package:bookia/feature/cart/presentation/widget/count_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CardItemWidegt extends StatelessWidget {
  const CardItemWidegt({
    super.key,
    required this.cartItems,
    required this.onRemove,
    required this.onAdd,
    required this.onDelete,
  });
  final CartItem cartItems;
  final Function() onRemove;
  final Function() onAdd;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NetWorkImageWidget(
          image: cartItems.itemProductImage,
          height: 118.0,
          width: 100.0,
        ),
        Gap(10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItems.itemProductName.toString(),
                style: TextstyleApp.black18W400,
                maxLines: 2,
              ),
              Gap(10.0),
              Text(
                cartItems.itemProductPrice.toString(),
                style: TextstyleApp.black15W400.copyWith(fontSize: 16.0),
              ),
              CountWidget(
                onadd: onAdd,
                onremove: onRemove,
                quantity: cartItems.itemQuantity.toString(),
              ),
            ],
          ),
        ),
        InkWell(onTap: onDelete, child: SvgPicture.asset(IconApp.closed)),
      ],
    );
  }
}
