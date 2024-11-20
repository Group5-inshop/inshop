class Order {
  final String id;
  final String customerId;
  final String customerName;
  final DateTime orderDate;
  final List<OrderItem> items;
  final double totalAmount;
  final OrderStatus status;
  final PaymentStatus paymentStatus;

  const Order({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.orderDate,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.paymentStatus,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      orderDate: DateTime.parse(json['orderDate']),
      items: List<OrderItem>.from(
        json['items'].map((item) => OrderItem.fromJson(item)),
      ),
      totalAmount: json['totalAmount']?.toDouble() ?? 0.0,
      status: OrderStatus.values.byName(json['status'] as String),
      paymentStatus:
          PaymentStatus.values.byName(json['paymentStatus'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'customerName': customerName,
      'orderDate': orderDate.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'status': status.toString(),
      'paymentStatus': paymentStatus.toString(),
    };
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      price: json['price']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }
}

enum OrderStatus { pending, processing, shipped, delivered, canceled }

enum PaymentStatus { unpaid, paid }
