import 'package:bookia/feature/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/Home/presentation/widget/search_body_widget.dart';
import 'package:bookia/feature/Home/presentation/widget/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormWidget(
                      onChanged: (value) {
                        cubit.searchData(value);
                      },
                    ),
                    SearchBodyWidget(cubit: cubit),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
