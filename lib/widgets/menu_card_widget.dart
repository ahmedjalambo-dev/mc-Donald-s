import 'package:flutter/material.dart';
import 'package:mc_donalds/widgets/card_widget.dart';

class MenuCardWidget extends StatelessWidget {
  final String name;
  final String numOfFlavours;
  final String imageUrl;
  final void Function()? onPressed;

  const MenuCardWidget({
    super.key,
    required this.name,
    required this.numOfFlavours,
    required this.imageUrl,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // White Card
        CardWidget(size: size, name: name, numOfFlavours: numOfFlavours),

        /// Arrow Button
        Positioned(
          right: size.width * 0.01,
          bottom: size.width * 0.08,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward),
          ),
        ),

        /// Image Above Card
        Positioned(
          bottom: size.height * 0.035,
          left: size.width * 0.01,
          child: Image.asset(
            imageUrl,
            height: size.height * 0.20,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
