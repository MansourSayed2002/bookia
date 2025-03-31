import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/feature/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ColorApp.primery,
          unselectedItemColor: ColorApp.grey,
          onTap: (value) {
            context.read<MainCubit>().changepage(value);
          },
          currentIndex: context.read<MainCubit>().currentindex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconApp.home),
              label: "",
              activeIcon: SvgPicture.asset(
                IconApp.home,
                colorFilter: ColorFilter.mode(
                  ColorApp.primery,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconApp.wishlist),
              label: "",
              activeIcon: SvgPicture.asset(
                IconApp.wishlist,
                colorFilter: ColorFilter.mode(
                  ColorApp.primery,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconApp.card),
              label: "",
              activeIcon: SvgPicture.asset(
                IconApp.card,
                colorFilter: ColorFilter.mode(
                  ColorApp.primery,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconApp.profile),
              label: "",
              activeIcon: SvgPicture.asset(
                IconApp.profile,
                colorFilter: ColorFilter.mode(
                  ColorApp.primery,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
