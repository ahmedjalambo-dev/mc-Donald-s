import 'package:flutter/material.dart';
import 'package:mc_donalds/models/cart_item_model.dart';
import 'package:mc_donalds/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItemModel> _items = {};

  Map<String, CartItemModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.flavour)) {
      // If item is already in the cart, just update the quantity
      _items.update(
        product.flavour,
        (existingCartItem) => CartItemModel(
          id: existingCartItem.id,
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + quantity,
        ),
      );
    } else {
      // Otherwise, add a new item
      _items.putIfAbsent(
        product.flavour,
        () => CartItemModel(
          id: product.flavour,
          product: product,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void updateItemQuantity(String productId, int newQuantity) {
    if (_items.containsKey(productId)) {
      if (newQuantity > 0) {
        _items.update(
          productId,
          (existing) => CartItemModel(
            id: existing.id,
            product: existing.product,
            quantity: newQuantity,
          ),
        );
      } else {
        // Remove item if quantity is zero or less
        removeItem(productId);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
