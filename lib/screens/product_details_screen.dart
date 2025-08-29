import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_donalds/models/product_details_model.dart';
import 'package:mc_donalds/widgets/shadow_widget.dart';

class ProdcutDetailsScreen extends StatefulWidget {
  final List<ProductDetailsModel> productDetailsModel;
  const ProdcutDetailsScreen({super.key, required this.productDetailsModel});

  @override
  State<ProdcutDetailsScreen> createState() => _ProdcutDetailsScreenState();
}

class _ProdcutDetailsScreenState extends State<ProdcutDetailsScreen> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;
  int selectedIndex = 0;
  int? selectedSize;
  bool isSelectedSize = false;
  double drinkSize = 1.1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
        selectedIndex = _currentPage.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> priceParts = widget.productDetailsModel[selectedIndex].price
        .toStringAsFixed(2)
        .split('.');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
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
                      widget.productDetailsModel[selectedIndex].flavour,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.productDetailsModel[selectedIndex].title),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '£${priceParts[0]}.',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      priceParts[1],
                      style: TextStyle(
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
            itemCount: widget.productDetailsModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final scale = drinkSize - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 400;
              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          ShadowWidget(),
                          SizedBox(
                            child: Image.asset(
                              widget.productDetailsModel[index].image,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),

          ///
        ],
      ),
    );
  }
}
