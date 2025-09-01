import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_donalds/models/product_details_model.dart';
import 'package:mc_donalds/screens/product_details_screen.dart';
import 'package:mc_donalds/widgets/menu_card_widget.dart';
import 'package:mc_donalds/models/menu_model.dart';
import 'package:mc_donalds/screens/soon_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
        ),
        actions: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 8),
            child: IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.bag, color: Colors.black, size: 28),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: MenuModel.listMenu.length,
        itemBuilder: (context, index) {
          final item = MenuModel.listMenu[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: MenuCardWidget(
              name: item.name,
              numOfFlavours: item.numOfFlavours,
              imageUrl: item.imageUrl,
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => index == 0
                      ? ProdcutDetailsScreen(productDetailsModel: burgers)
                      : (index == 1
                            ? ProdcutDetailsScreen(
                                productDetailsModel: milkshakeDrinks,
                              )
                            : (index == 2
                                  ? ProdcutDetailsScreen(
                                      productDetailsModel: chocolateDrinks,
                                    )
                                  : (index == 3
                                        ? ProdcutDetailsScreen(
                                            productDetailsModel:
                                                milkshakeDrinks,
                                          )
                                        : SoonScreen()))),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
