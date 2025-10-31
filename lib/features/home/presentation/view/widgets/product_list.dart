import 'package:flutter/material.dart';
import 'package:hungry/features/home/presentation/view/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 8,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.4 / 2.54,
          ),
          itemBuilder: (context, index){
            return const ProductItem();
          }
      ),
    );
  }
}
