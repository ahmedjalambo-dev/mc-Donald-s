import 'package:mc_donalds/models/product_model.dart';

class CartItemModel {
  final String id; // Unique ID for the cart item, based on product flavour
  final ProductModel product;
  int quantity;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
  });
}
