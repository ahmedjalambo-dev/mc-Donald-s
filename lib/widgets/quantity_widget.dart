import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  final Function(int) onQuantityChanged;
  const QuantityWidget({super.key, required this.onQuantityChanged});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantityNumber = 1;

  void _updateQuantity(int newQuantity) {
    if (newQuantity > 0) {
      setState(() {
        quantityNumber = newQuantity;
      });
      widget.onQuantityChanged(quantityNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xffededed),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => _updateQuantity(quantityNumber + 1),
              icon: const Icon(Icons.add),
            ),
            CircleAvatar(
              backgroundColor: quantityNumber > 0
                  ? const Color(0xfffeb30a)
                  : Colors.transparent,
              radius: 30,
              child: Text(
                quantityNumber.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () => _updateQuantity(quantityNumber - 1),
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
