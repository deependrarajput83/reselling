import 'package:flutter/cupertino.dart';

import '../../../repo/orderrapo.dart';
import 'orderdata.dart';

class Orderdataprovider extends ChangeNotifier {
  List<OrderModel> newOrders = [];
  List<OrderModel> packedList = [];
  List<OrderModel> shippedList = [];
  List<OrderModel> outForDeliveryList = [];
  List<OrderModel> deliveredList = [];
  bool _loaded = false;
  void loadOrders() {
    if (_loaded) return;
    newOrders = OrderRepository.getOrders();
    _loaded = true;
    notifyListeners();
  }

  void acceptOrder(OrderModel order) {
    order.status = "packed";
    newOrders.removeWhere((o) => o.id == order.id);
    packedList.add(order);
    notifyListeners();
  }

  void Rejectorder(OrderModel order) {
    newOrders.removeWhere((o) => o.id == order.id);
    notifyListeners();
  }

  int getStepFromStatus(String status) {
    switch (status) {
      case "new":
        return 0;
      case "packed":
        return 1;
      case "shipped":
        return 2;
      case "out_for_delivery":
        return 3;
      case "delivered":
        return 4;
      default:
        return 0;
    }
  }

  void updateNextStatus(OrderModel order) {
    if (order.status == "packed") {
      order.status = "shipped";
      packedList.removeWhere((o) => o.id == order.id);
      shippedList.add(order);
    } else if (order.status == "shipped") {
      order.status = "out_for_delivery";
      shippedList.removeWhere((o) => o.id == order.id);
      outForDeliveryList.add(order);
    } else if (order.status == "out_for_delivery") {
      order.status = "delivered";
      outForDeliveryList.removeWhere((o) => o.id == order.id);
      deliveredList.add(order);
    }
    notifyListeners();
  }
}
