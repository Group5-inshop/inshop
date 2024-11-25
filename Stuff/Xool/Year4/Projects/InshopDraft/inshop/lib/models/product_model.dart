class Product {
  final String id;
  final String title;
  final double rating;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.rating,
    required this.price,
    required this.imageUrl,
  });

  // Factory method to create a Product from a Map (for Supabase data)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['product_name'], // Change this if necessary
      rating: map['rating'],
      price: map['price'],
      imageUrl: map['imageUrl'], // Adjust as per your actual column name
    );
  }
}
