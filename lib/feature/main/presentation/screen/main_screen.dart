import 'package:bookia/feature/main/presentation/cubit/main_cubit.dart';
import 'package:bookia/feature/main/presentation/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MainCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: BlocBuilder<MainCubit, MainState>(
          builder:
              (context, state) => context.read<MainCubit>().screens.elementAt(
                context.read<MainCubit>().currentindex,
              ),
        ),
      ),
    );
  }
}
