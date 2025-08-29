import 'package:mc_donalds/constants/app_assets.dart';

class ProductDetailsModel {
  final String title;
  final String flavour;
  final String image;
  final double price;

  ProductDetailsModel({
    required this.title,
    required this.flavour,
    required this.image,
    required this.price,
  });
}

List<ProductDetailsModel> coffeDrinks = [
  ProductDetailsModel(
    title: 'Coffe Drink',
    flavour: 'Espresso',
    price: 5.65,
    image: '${AppAssets.coffeeDrinks}Espresso.png',
  ),
  ProductDetailsModel(
    title: 'Coffe Drink',
    flavour: 'Cappuccino',
    price: 3.25,
    image: '${AppAssets.coffeeDrinks}Cappuccino.png',
  ),
  ProductDetailsModel(
    title: 'Coffe Drink',
    flavour: 'Hot Tea',
    price: 2.70,
    image: '${AppAssets.coffeeDrinks}HotTea.png',
  ),
  ProductDetailsModel(
    title: 'Coffe Drink',
    flavour: 'Ice Coffee',
    price: 7,
    image: '${AppAssets.coffeeDrinks}IceCoffee.png',
  ),
  ProductDetailsModel(
    title: 'Coffe Drink',
    flavour: 'IceTea',
    price: 9,
    image: '${AppAssets.coffeeDrinks}IceTea.png',
  ),
  ProductDetailsModel(
    title: 'Coffe Drink',
    flavour: 'Mixed Black Coffee',
    price: 10,
    image: '${AppAssets.coffeeDrinks}MixedBlackCoffee.png',
  ),
];
List<ProductDetailsModel> chocolateDrinks = [
  ProductDetailsModel(
    title: 'Chocolate Drink',
    flavour: 'Caramel',
    price: 5,
    image: '${AppAssets.chocolateDrinks}caramel.png',
  ),
  ProductDetailsModel(
    title: 'Chocolate Drink',
    flavour: 'Chocolate',
    price: 5,
    image: '${AppAssets.chocolateDrinks}chocolate.png',
  ),
  ProductDetailsModel(
    title: 'Chocolate Drink',
    flavour: 'Hot Chocolate',
    price: 6,
    image: '${AppAssets.chocolateDrinks}Hot Chocolate.png',
  ),
];
List<ProductDetailsModel> milkshakeDrinks = [
  ProductDetailsModel(
    title: 'Milkshake',
    flavour: 'Salted Caramel',
    price: 5,
    image: '${AppAssets.milkshakeDrinks}Salted Caramel.png',
  ),
  ProductDetailsModel(
    title: 'Milkshake',
    flavour: 'Banana',
    price: 5,
    image: '${AppAssets.milkshakeDrinks}banana.png',
  ),
  ProductDetailsModel(
    title: 'Milkshake',
    flavour: 'Brownie Island',
    price: 5,
    image: '${AppAssets.milkshakeDrinks}brownie-island.png',
  ),
  ProductDetailsModel(
    title: 'Milkshake',
    flavour: 'Peanut Butter',
    price: 6,
    image: '${AppAssets.milkshakeDrinks}peanut-butter.png',
  ),
  ProductDetailsModel(
    title: 'Milkshake',
    flavour: 'Strawberry',
    price: 6,
    image: '${AppAssets.milkshakeDrinks}strawberry.png',
  ),
];
List<ProductDetailsModel> burgers = [
  ProductDetailsModel(
    title: 'Burger',
    flavour: 'Cheese',
    price: 5.49,
    image: '${AppAssets.burgers}Cheese.png',
  ),
  ProductDetailsModel(
    title: 'Burger',
    flavour: 'Chicken',
    price: 7.39,
    image: '${AppAssets.burgers}Chicken.png',
  ),
  ProductDetailsModel(
    title: 'Burger',
    flavour: 'Meaty',
    price: 9,
    image: '${AppAssets.burgers}Meaty.png',
  ),
  ProductDetailsModel(
    title: 'Burger',
    flavour: 'Mixed Veggies',
    price: 12.59,
    image: '${AppAssets.burgers}MixedVeggies.png',
  ),
  ProductDetailsModel(
    title: 'Burger',
    flavour: 'Plumpy',
    price: 15.00,
    image: '${AppAssets.burgers}Plumpy.png',
  ),
  ProductDetailsModel(
    title: 'Burger',
    flavour: 'Veggies',
    price: 6.59,
    image: '${AppAssets.burgers}Veggies.png',
  ),
];
