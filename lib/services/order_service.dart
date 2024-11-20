// TODO Implement this library.
import 'package:inshop/models/order.dart';

class OrderService {
  static List<Order> _orders = [];

  static Future<void> createOrder(Order order) async {
    _orders.add(order);
    // In a real-world scenario, you'd persist the order to a database or API
  }

  static Future<List<Order>> getOrders() async {
    // Simulate fetching orders from a database or API
    return _orders;
  }

  static Future<void> updateOrder(Order order) async {
    final index = _orders.indexWhere((o) => o.id == order.id);
    if (index != -1) {
      _orders[index] = order;
    }
    // In a real-world scenario, you'd update the order in the database or API
  }

  static Future<void> deleteOrder(String orderId) async {
    _orders.removeWhere((order) => order.id == orderId);
    // In a real-world scenario, you'd delete the order from the database or API
  }
}
