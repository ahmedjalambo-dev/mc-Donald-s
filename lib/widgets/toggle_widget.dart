import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isIced = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          _buildToggleSelection('Hot', !isIced),
          _buildToggleSelection('Iced', isIced),
        ],
      ),
    );
  }

  Widget _buildToggleSelection(String lable, bool selected) {
    return GestureDetector(
      onTap: () => setState(() => isIced = lable == 'Iced'),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: selected ? Color(0xfffeb30a) : Color(0xffededed),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          lable,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
