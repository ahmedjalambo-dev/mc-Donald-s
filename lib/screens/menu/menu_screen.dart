import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_donalds/constants/app_assets.dart';
import 'package:mc_donalds/screens/menu/menu_card.dart';
import 'package:mc_donalds/screens/menu/menu_model.dart';

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
            child: MenuCard(
              name: item.name,
              numOfFlavours: item.numOfFlavours,
              imageUrl: item.imageUrl,
            ),
          );
        },
      ),
    );
  }
}
