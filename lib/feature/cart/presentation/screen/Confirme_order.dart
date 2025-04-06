import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/message_bar.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/shared/loading_widget.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/cart/data/model/check_out_user_model/check_out_user_model.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/widget/drop_button_widget.dart';
import 'package:bookia/feature/main/presentation/screen/main_screen.dart';
import 'package:bookia/feature/profile/presentation/widget/buttomnavigatonbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ConfirmeOrderScreen extends StatelessWidget {
  const ConfirmeOrderScreen({super.key, required this.checkOutUserModel});
  final CheckOutUserModel checkOutUserModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CartCubit()..init(checkOutUserModel),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomButtonBackGlobal(),
          centerTitle: true,
          title: Text(
            TextApp.confirmOrder,
            style: TextstyleApp.black18W400.copyWith(fontSize: 24.0),
          ),
        ),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            var cubit = context.read<CartCubit>();
            return ButtomnavigatonbarWidget(
              title: TextApp.confirme,
              onTap: () {
                cubit.confirmeOrder();
              },
            );
          },
        ),
        body: CustomBody(checkOutUserModel: checkOutUserModel),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.checkOutUserModel});
  final CheckOutUserModel checkOutUserModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CheckOutSuccess) {
          context.removeUntile(MainScreen());
        } else if (state is CheckOutError) {
          context.messageBar(state.message);
        } else if (state is CheckOutLoading) {
          loadingWidget(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<CartCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Gap(30.0),
                CustomTextFromGlobal(
                  controller: cubit.name,
                  hinttext: TextApp.name,
                  validator: (value) {
                    return validationField("text", 3, 40, value);
                  },
                ),
                CustomTextFromGlobal(
                  controller: cubit.phone,
                  hinttext: TextApp.phone,
                  validator: (value) {
                    return validationField("phone", 11, 11, value);
                  },
                ),
                CustomTextFromGlobal(
                  controller: cubit.address,
                  hinttext: TextApp.address,
                  validator: (value) {
                    return validationField("numtext", 4, 30, value);
                  },
                ),
                CustomTextFromGlobal(
                  controller: cubit.email,
                  hinttext: TextApp.email,
                  validator: (value) {
                    return validationField("email", 4, 40, value);
                  },
                ),
                DropButtonWidget(
                  items: cubit.governoratesModel?.data ?? [],
                  onChanged: (value) {
                    cubit.governorate.text = value.toString();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
