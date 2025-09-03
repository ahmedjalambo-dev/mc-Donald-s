import 'package:mc_donalds/constants/app_assets.dart';

class ProductModel {
  final String title;
  final String flavour;
  final String image;
  final double price;

  ProductModel({
    required this.title,
    required this.flavour,
    required this.image,
    required this.price,
  });
}

List<ProductModel> coffeDrinks = [
  ProductModel(
    title: 'Coffe Drink',
    flavour: 'Espresso',
    price: 5.65,
    image: '${AppAssets.coffeeDrinks}Espresso.png',
  ),
  ProductModel(
    title: 'Coffe Drink',
    flavour: 'Cappuccino',
    price: 3.25,
    image: '${AppAssets.coffeeDrinks}Cappuccino.png',
  ),
  ProductModel(
    title: 'Coffe Drink',
    flavour: 'Hot Tea',
    price: 2.70,
    image: '${AppAssets.coffeeDrinks}HotTea.png',
  ),
  ProductModel(
    title: 'Coffe Drink',
    flavour: 'Ice Coffee',
    price: 7,
    image: '${AppAssets.coffeeDrinks}IceCoffee.png',
  ),
  ProductModel(
    title: 'Coffe Drink',
    flavour: 'IceTea',
    price: 9,
    image: '${AppAssets.coffeeDrinks}IceTea.png',
  ),
  ProductModel(
    title: 'Coffe Drink',
    flavour: 'Mixed Black Coffee',
    price: 10,
    image: '${AppAssets.coffeeDrinks}MixedBlackCoffee.png',
  ),
];

List<ProductModel> milkshakeDrinks = [
  ProductModel(
    title: 'Milkshake',
    flavour: 'Caramel',
    price: 5,
    image: '${AppAssets.chocolateDrinks}caramel.png',
  ),
  ProductModel(
    title: 'Milkshake',
    flavour: 'Salted Caramel',
    price: 5,
    image: '${AppAssets.milkshakeDrinks}Salted Caramel.png',
  ),
  ProductModel(
    title: 'Milkshake',
    flavour: 'Banana',
    price: 5,
    image: '${AppAssets.milkshakeDrinks}banana.png',
  ),
  ProductModel(
    title: 'Milkshake',
    flavour: 'Brownie Island',
    price: 5,
    image: '${AppAssets.milkshakeDrinks}brownie-island.png',
  ),
  ProductModel(
    title: 'Milkshake',
    flavour: 'Peanut Butter',
    price: 6,
    image: '${AppAssets.milkshakeDrinks}peanut-butter.png',
  ),
  ProductModel(
    title: 'Milkshake',
    flavour: 'Strawberry',
    price: 6,
    image: '${AppAssets.milkshakeDrinks}strawberry.png',
  ),
];
List<ProductModel> burgers = [
  ProductModel(
    title: 'Burger',
    flavour: 'Cheese',
    price: 5.49,
    image: '${AppAssets.burgers}Cheese.png',
  ),
  ProductModel(
    title: 'Burger',
    flavour: 'Chicken',
    price: 7.39,
    image: '${AppAssets.burgers}Chicken.png',
  ),
  ProductModel(
    title: 'Burger',
    flavour: 'Meaty',
    price: 9,
    image: '${AppAssets.burgers}Meaty.png',
  ),
  ProductModel(
    title: 'Burger',
    flavour: 'Mixed Veggies',
    price: 12.59,
    image: '${AppAssets.burgers}MixedVeggies.png',
  ),
  ProductModel(
    title: 'Burger',
    flavour: 'Plumpy',
    price: 15.00,
    image: '${AppAssets.burgers}Plumpy.png',
  ),
  ProductModel(
    title: 'Burger',
    flavour: 'Veggies',
    price: 6.59,
    image: '${AppAssets.burgers}Veggies.png',
  ),
];
