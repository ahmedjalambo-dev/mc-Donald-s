import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.size,
    required this.name,
    required this.numOfFlavours,
    this.onTap,
  });

  final Size size;
  final String name;
  final String numOfFlavours;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.15,
        padding: EdgeInsets.only(bottom: size.width * 0.08),
        margin: const EdgeInsets.symmetric(vertical: 35),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            /// Name Title and Number of Flavours
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$numOfFlavours of different flavours',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(width: size.width * 0.08),
          ],
        ),
      ),
    );
  }
}
