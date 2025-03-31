import 'package:bloc/bloc.dart';
import 'package:bookia/feature/Home/presentation/screen/home_screen.dart';
import 'package:bookia/feature/cart/presentation/screen/cart_screen.dart';
import 'package:bookia/feature/profile/presentation/screen/profile_screen.dart';
import 'package:bookia/feature/wishlist/presentation/screen/wishlist_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int currentindex = 0;

  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  changepage(index) {
    currentindex = index;
    emit(MainChangePage());
  }
}
