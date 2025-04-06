import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/order/presentation/cubit/order_cubit.dart';
import 'package:bookia/feature/order/presentation/widget/card_widget.dart';
import 'package:bookia/feature/order/presentation/widget/information_of_owner_the_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key, required this.idOrder});
  final String idOrder;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: OrderCubit()..getInfoOrders(idOrder),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomButtonBackGlobal(),
          centerTitle: true,
          title: Text(
            TextApp.infoOrder,
            style: TextstyleApp.black18W400.copyWith(fontSize: 24.0),
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
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        var cubit = context.read<OrderCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextApp.infoUser,
                  style: TextstyleApp.black30W400.copyWith(fontSize: 24.0),
                ),
                Gap(10.0),
                InformationOfOwnerTheOrder(cubit: cubit),
                Gap(10.0),
                Text(
                  TextApp.infoOrder,
                  style: TextstyleApp.black30W400.copyWith(fontSize: 24.0),
                ),
                Gap(10.0),
                CardWidget(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product name : ${cubit.infoOrderModel?.data?.orderProducts?.first.productName}",
                        style: TextstyleApp.white20W400,
                      ),
                      Gap(8.0),
                      Text(
                        "Quantity : ${cubit.infoOrderModel?.data?.orderProducts?.first.orderProductQuantity}",
                        style: TextstyleApp.white20W400,
                      ),
                      Gap(8.0),
                      Text(
                        "Price : ${cubit.infoOrderModel?.data?.orderProducts?.first.productPrice}",
                        style: TextstyleApp.white20W400,
                      ),
                      Gap(8.0),

                      Text(
                        "Discount : ${cubit.infoOrderModel?.data?.orderProducts?.first.productDiscount}%",
                        maxLines: 3,
                        style: TextstyleApp.white20W400,
                      ),
                      Gap(8.0),
                      Text(
                        "Total : ${cubit.infoOrderModel?.data?.orderProducts?.first.productTotal}",
                        maxLines: 3,
                        style: TextstyleApp.white20W400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
