import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantityNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Color(0xffededed),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            IconButton(
              onPressed: () => setState(() => quantityNumber++),
              icon: Icon(Icons.add),
            ),
            CircleAvatar(
              backgroundColor: quantityNumber > 0
                  ? Color(0xfffeb30a)
                  : Colors.white,
              radius: 30,
              child: Text(
                quantityNumber.toString(),
                style: TextStyle(
                  color: quantityNumber > 0 ? Colors.white : Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: () => setState(
                () => quantityNumber > 0 ? quantityNumber-- : quantityNumber,
              ),
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
