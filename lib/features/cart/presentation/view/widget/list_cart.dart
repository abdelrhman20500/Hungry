import 'package:flutter/material.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';

import 'cart_item.dart';

class ListCart extends StatelessWidget {
  const ListCart({super.key, required this.model,});

  final CartModel model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: model.data!.items!.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CartItem(
                title: model.data!.items![index].name!,
                image: model.data!.items![index].image!,
                itemId: model.data!.items![index].itemId!,
                quantity: model.data!.items![index].quantity!,
              ),
            );
          }),
    );
  }
}
