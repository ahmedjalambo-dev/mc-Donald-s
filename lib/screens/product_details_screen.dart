import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_donalds/models/product_details_model.dart';
import 'package:mc_donalds/widgets/product_image_widget.dart';
import 'package:mc_donalds/widgets/quantity_widget.dart';
import 'package:mc_donalds/widgets/shadow_widget.dart';
import 'package:mc_donalds/widgets/toggle_widget.dart';

class ProdcutDetailsScreen extends StatefulWidget {
  final List<ProductDetailsModel> productDetailsModel;
  const ProdcutDetailsScreen({super.key, required this.productDetailsModel});

  @override
  State<ProdcutDetailsScreen> createState() => _ProdcutDetailsScreenState();
}

class _ProdcutDetailsScreenState extends State<ProdcutDetailsScreen> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;
  int selectedPageIndex = 0;
  double drinkSize = 1.1;
  int selectedSizeIndex = 0;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> priceParts = widget
        .productDetailsModel[selectedPageIndex]
        .price
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
                      widget.productDetailsModel[selectedPageIndex].flavour,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.productDetailsModel[selectedPageIndex].title),
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
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          child: Stack(
                            children: [
                              ShadowWidget(),
                              ProductImageWidget(
                                productDetailsModel: widget.productDetailsModel,
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
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              spacing: 18,
              children: [
                /// Size
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => GestureDetector(
                      onTap: () => setState(() => selectedSizeIndex = index),
                      child: Column(
                        spacing: 8,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: selectedSizeIndex == index
                                ? Color(0xffffd600)
                                : Color(0xffababab),
                            child: CircleAvatar(
                              backgroundColor: selectedSizeIndex == index
                                  ? Color(0xfffeb30a)
                                  : Colors.white,
                              radius: 24.5,
                              child: SvgPicture.asset(
                                'assets/images/icons/cup.svg',
                                color: selectedSizeIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                width: index == 0
                                    ? 16
                                    : (index == 1
                                          ? 18
                                          : (index == 2 ? 24 : 24)),
                              ),
                            ),
                          ),
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

                /// Hot Or Iced
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 18,
                  children: [ToggleWidget(), QuantityWidget()],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
