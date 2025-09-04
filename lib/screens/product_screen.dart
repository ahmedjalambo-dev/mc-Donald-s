import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_donalds/models/product_model.dart';
import 'package:mc_donalds/providers/cart_provider.dart';
import 'package:mc_donalds/screens/cart_screen.dart';
import 'package:mc_donalds/widgets/customize_button_widget.dart';
import 'package:mc_donalds/widgets/product_image_widget.dart';
import 'package:mc_donalds/widgets/quantity_widget.dart';
import 'package:mc_donalds/widgets/shadow_widget.dart';
import 'package:mc_donalds/widgets/toggle_widget.dart';
import 'package:provider/provider.dart';

class ProdcutScreen extends StatefulWidget {
  final List<ProductModel> productModel;
  const ProdcutScreen({super.key, required this.productModel});

  @override
  State<ProdcutScreen> createState() => _ProdcutScreenState();
}

class _ProdcutScreenState extends State<ProdcutScreen> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;
  int selectedPageIndex = 0;
  double drinkSize = 1.1;
  int selectedSizeIndex = 0;
  int _currentQuantity = 1; // Add state for quantity

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
        selectedPageIndex = _currentPage.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> priceParts = widget.productModel[selectedPageIndex].price
        .toStringAsFixed(2)
        .split('.');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              label: Text(cart.itemCount.toString()),
              isLabelVisible: cart.itemCount > 0,
              child: ch,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (ctx) => const CartScreen()),
                );
              },
              icon: const Icon(
                CupertinoIcons.bag,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          /// info bar
          Positioned(
            top: 0,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel[selectedPageIndex].flavour,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.productModel[selectedPageIndex].title),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '£${priceParts[0]}.',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      priceParts[1],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// product iamge
          PageView.builder(
            controller: _controller,
            itemCount: widget.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final scale = drinkSize - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 400;
              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Stack(
                            children: [
                              const ShadowWidget(),
                              ProductImageWidget(
                                productDetailsModel: widget.productModel,
                                index: index,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          /// Details Order
          Positioned(
            bottom: 80, // Adjusted bottom position
            left: 20,
            right: 20,
            child: Column(
              children: [
                /// Size
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => GestureDetector(
                      onTap: () => setState(() => selectedSizeIndex = index),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: selectedSizeIndex == index
                                ? const Color(0xffffd600)
                                : const Color(0xffababab),
                            child: CircleAvatar(
                              backgroundColor: selectedSizeIndex == index
                                  ? const Color(0xfffeb30a)
                                  : Colors.white,
                              radius: 23.5,
                              child: SvgPicture.asset(
                                widget.productModel[0].title == 'Milkshake'
                                    ? 'assets/images/icons/cup.svg'
                                    : 'assets/images/icons/burger.svg',
                                colorFilter: const ColorFilter.mode(
                                  Colors.black,
                                  BlendMode.srcIn,
                                ),
                                width: index == 0
                                    ? 22
                                    : (index == 1
                                          ? 24
                                          : (index == 2 ? 30 : 30)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            index == 0
                                ? 'Small'
                                : (index == 1 ? 'Medium' : 'Large'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                /// Hot Or Iced
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: widget.productModel[0].title == 'Milkshake',
                      child: const ToggleWidget(),
                    ),
                    Visibility(
                      visible: !(widget.productModel[0].title == 'Milkshake'),
                      child: const CustomizeButtonWidget(),
                    ),
                    const SizedBox(width: 18),
                    QuantityWidget(
                      onQuantityChanged: (newQuantity) {
                        setState(() {
                          _currentQuantity = newQuantity;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add to Order Button
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfffeb30a),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                final cart = Provider.of<CartProvider>(context, listen: false);
                final productToAdd = widget.productModel[selectedPageIndex];
                cart.addItem(productToAdd, _currentQuantity);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${productToAdd.flavour} added to cart!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                'Add to Order',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
