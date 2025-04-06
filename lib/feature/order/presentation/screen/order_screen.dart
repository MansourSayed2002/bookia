import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/order/data/model/order_history_model/order.dart';
import 'package:bookia/feature/order/presentation/cubit/order_cubit.dart';
import 'package:bookia/feature/order/presentation/screen/details_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: OrderCubit()..getOrders(),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomButtonBackGlobal(),
          centerTitle: true,
          title: Text(
            TextApp.historyOrder,
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
        if (state is OrderLoading) {
          return Center(child: Lottie.asset(ImageApp.loading));
        }
        List<Order> order = cubit.orderHistoryModel?.data?.orders ?? [];
        return ListView.separated(
          separatorBuilder: (context, index) => Gap(10.0),
          itemCount: order.length,
          itemBuilder:
              (context, index) => InkWell(
                onTap: () {
                  context.push(
                    DetailsOrder(idOrder: order[index].id.toString()),
                  );
                },
                child: ListTile(
                  title: Text(
                    order[index].orderCode.toString(),
                    style: TextstyleApp.black30W400.copyWith(fontSize: 20.0),
                  ),
                  subtitle: Text(
                    order[index].total.toString(),
                    style: TextstyleApp.black15W400.copyWith(
                      color: ColorApp.red,
                    ),
                  ),
                  trailing: Text(
                    order[index].orderDate.toString(),
                    style: TextstyleApp.grey14W400.copyWith(fontSize: 16),
                  ),
                ),
              ),
        );
      },
    );
  }
}
