import 'package:bloc/bloc.dart';
import 'package:bookia/feature/order/data/model/info_order_model/info_order_model.dart';
import 'package:bookia/feature/order/data/model/order_history_model/order_history_model.dart';
import 'package:bookia/feature/order/data/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  InfoOrderModel? infoOrderModel;
  OrderHistoryModel? orderHistoryModel;
  Future<void> getOrders() async {
    emit(OrderLoading());
    Future.delayed(Duration(seconds: 2));
    await OrderRepo.getOrder().then((value) {
      if (value is OrderHistoryModel) {
        orderHistoryModel = value;
        emit(OrderSuccess());
      } else {
        emit(OrderError(message: "Some thing is wrong"));
      }
    });
  }

  Future<void> getInfoOrders(String id) async {
    emit(OrderLoading());
    await OrderRepo.getInfoOrder(id).then((value) {
      if (value is InfoOrderModel) {
        infoOrderModel = value;
        emit(OrderSuccess());
      } else {
        emit(OrderError(message: "Some thing is wrong"));
      }
    });
  }
}
