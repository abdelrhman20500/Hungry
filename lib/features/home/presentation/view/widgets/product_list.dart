import 'package:flutter/material.dart';
import 'package:hungry/features/home/data/model/product_model.dart';
import 'package:hungry/features/home/presentation/view/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.model,});

  final List<Data> model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: model.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
            crossAxisSpacing: 14.0,
            childAspectRatio: 1.4 / 2.6,
          ),
          itemBuilder: (context, index){
            return ProductItem(
              id: model[index].id!,
              image: model[index].image!,
              title: model[index].name!,
              description: model[index].description!,
              rating:model[index].rating!,
              price: model[index].price!,
            );
          }
      ),
    );
  }
}
