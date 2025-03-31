import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/Home/data/model/response/best_seller_model/best_seller_model.dart';

class GetBestSeller {
  static getBestSeller() async {
    var response = await ApiConnect.getData(LinkApp.bestSeller);
    if (response.statusCode == 200) {
      return BestSellerModel.fromJson(response.data);
    } else {
      return StatusRequest.failure;
    }
  }
}
