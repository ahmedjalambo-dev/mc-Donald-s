import 'package:flutter/cupertino.dart';
import 'package:mc_donalds/models/product_model.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    super.key,
    required this.productDetailsModel,
    required this.index,
  });

  final List<ProductModel> productDetailsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      left: 0,
      child: Image.asset(productDetailsModel[index].image, fit: BoxFit.contain),
    );
  }
}
