import 'package:flutter/material.dart';
import 'package:mc_donalds/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('My Order'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text(
                      'Your cart is empty!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (ctx, i) {
                      final item = cartItems[i];
                      return ListTile(
                        leading: Image.asset(
                          item.product.image,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                        title: Text(item.product.flavour),
                        subtitle: Text(
                          'Price: £${item.product.price.toStringAsFixed(2)}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                cart.updateItemQuantity(
                                  item.id,
                                  item.quantity - 1,
                                );
                              },
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cart.updateItemQuantity(
                                  item.id,
                                  item.quantity + 1,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          if (cartItems.isNotEmpty) _buildCheckoutCard(context, cart),
        ],
      ),
    );
  }

  Widget _buildCheckoutCard(BuildContext context, CartProvider cart) {
    return Card(
      margin: const EdgeInsets.all(15),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Total',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Chip(
              label: Text(
                '£${cart.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: const Color(0xfffeb30a),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffffd600),
                foregroundColor: Colors.black,
              ),
              child: const Text('CHECKOUT'),
              onPressed: () {
                // Placeholder for checkout logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Checkout feature coming soon!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
