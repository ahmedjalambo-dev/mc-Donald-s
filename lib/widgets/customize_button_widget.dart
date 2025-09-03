import 'package:flutter/material.dart';

class CustomizeButtonWidget extends StatelessWidget {
  const CustomizeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xfffeb30a),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Customizes', style: TextStyle(fontSize: 18))],
        ),
      ),
    );
  }
}
