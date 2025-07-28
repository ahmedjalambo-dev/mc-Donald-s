import 'package:mc_donalds/constants/app_assets.dart';

class MenuModel {
  final String name;
  final int numOfFlavours;
  final String imageUrl;

  MenuModel({
    required this.name,
    required this.numOfFlavours,
    required this.imageUrl,
  });

  static List<MenuModel> listMenu = [
    MenuModel(
      name: 'Chicken Burger',
      numOfFlavours: 6,
      imageUrl: AppAssets.chickenBurger,
    ),

    MenuModel(
      name: 'Coffee Drinks',
      numOfFlavours: 5,
      imageUrl: AppAssets.coffeeDrinks,
    ),
    MenuModel(
      name: 'Chocolate Drinks',
      numOfFlavours: 3,
      imageUrl: AppAssets.chocolateDrinks,
    ),
    MenuModel(
      name: 'Milkshake',
      numOfFlavours: 5,
      imageUrl: AppAssets.milkshake,
    ),
    MenuModel(
      name: 'Colorful Donuts',
      numOfFlavours: 6,
      imageUrl: AppAssets.colorfulAndTastyDonuts,
    ),
    MenuModel(
      name: 'Pile of Wholegra',
      numOfFlavours: 6,
      imageUrl: AppAssets.pileOfWholegra,
    ),
  ];
}
