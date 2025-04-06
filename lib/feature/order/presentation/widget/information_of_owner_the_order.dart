import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/order/presentation/cubit/order_cubit.dart';
import 'package:bookia/feature/order/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InformationOfOwnerTheOrder extends StatelessWidget {
  const InformationOfOwnerTheOrder({
    super.key,
    required this.cubit,
  });

  final OrderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " name : ${cubit.infoOrderModel?.data?.name}",
            style: TextstyleApp.white20W400,
          ),
          Gap(8.0),
          Text(
            "phone : ${cubit.infoOrderModel?.data?.phone}",
            style: TextstyleApp.white20W400,
          ),
          Gap(8.0),
          Text(
            "Governorate : ${cubit.infoOrderModel?.data?.governorate}",
            style: TextstyleApp.white20W400,
          ),
          Text(
            "address : ${cubit.infoOrderModel?.data?.address}",
            maxLines: 3,
            style: TextstyleApp.white20W400,
          ),
        ],
      ),
    );
  }
}
