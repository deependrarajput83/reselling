import '../feature/orders/maplist.dart';
import '../feature/orders/viewmodel/orderdata.dart';

class OrderRepository {
  static List<OrderModel> getOrders() {
    return dummyOrders.map((e) => OrderModel.fromJson(e)).toList();
  }
}
