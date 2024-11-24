import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  final String imageUrl;
  final String title;
  final int quantity;
  final double price;
  final void Function(int newQuantity) onQuantityChanged;

  const CartProduct({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.price,
    required this.onQuantityChanged,
  });

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  late int _currentQuantity;

  @override
  void initState() {
    super.initState();
    _currentQuantity = widget.quantity;
  }

  void _incrementQuantity() {
    setState(() {
      _currentQuantity++;
    });
    widget.onQuantityChanged(_currentQuantity);
  }

  void _decrementQuantity() {
    if (_currentQuantity > 1) {
      setState(() {
        _currentQuantity--;
      });
      widget.onQuantityChanged(_currentQuantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: 120,
              width: 120,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 120),
            ),
          ),
          const SizedBox(width: 10),
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  '\$${widget.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: _decrementQuantity,
                      child: const Icon(Icons.remove, size: 18),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$_currentQuantity',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: _incrementQuantity,
                      child: const Icon(Icons.add, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
