import 'package:mc_donalds/constants/app_assets.dart';

class MenuModel {
  final String name;
  final String numOfFlavours;
  final String imageUrl;

  MenuModel({
    required this.name,
    required this.numOfFlavours,
    required this.imageUrl,
  });

  static List<MenuModel> listMenu = [
    MenuModel(
      name: 'Chicken Burger',
      numOfFlavours: '6 sets',
      imageUrl: AppAssets.chickenBurger,
    ),

    MenuModel(
      name: 'Coffee Drinks',
      numOfFlavours: '5 cups',
      imageUrl: AppAssets.coffeeDrinks,
    ),
    MenuModel(
      name: 'Chocolate Drinks',
      numOfFlavours: '3 cups',
      imageUrl: AppAssets.chocolateDrinks,
    ),
    MenuModel(
      name: 'Milkshake',
      numOfFlavours: '5 cups',
      imageUrl: AppAssets.milkshake,
    ),
    MenuModel(
      name: 'Colorful Donuts',
      numOfFlavours: '6 sets',
      imageUrl: AppAssets.colorfulAndTastyDonuts,
    ),
    MenuModel(
      name: 'Pile of Wholegra',
      numOfFlavours: '6 sets',
      imageUrl: AppAssets.pileOfWholegra,
    ),
  ];
}
