import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final String numOfFlavours;
  final String imageUrl;

  const MenuCard({
    super.key,
    required this.name,
    required this.numOfFlavours,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // White Card
        Container(
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

        /// Arrow Button
        Positioned(
          right: size.width * 0.01,
          bottom: size.width * 0.08,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward, color: Colors.black, size: 24),
          ),
        ),
        // Image Above Card
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
