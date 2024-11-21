// order.dart
class Order {
  final String id;
  final String productId;
  final String customerId;
  final int quantity;
  final String status; // e.g., 'Pending', 'Completed', 'Cancelled'

  Order({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.quantity,
    required this.status,
  });
}
