// order_service.dart
import 'package:flutter/material.dart';
import 'order.dart';

class OrderService with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners(); // Notify listeners about the change
  }

  void updateOrder(Order updatedOrder) {
    final index = _orders.indexWhere((order) => order.id == updatedOrder.id);
    if (index != -1) {
      _orders[index] = updatedOrder;
      notifyListeners(); // Notify listeners about the change
    }
  }

  void deleteOrder(String orderId) {
    _orders.removeWhere((order) => order.id == orderId);
    notifyListeners(); // Notify listeners about the change
  }
}
