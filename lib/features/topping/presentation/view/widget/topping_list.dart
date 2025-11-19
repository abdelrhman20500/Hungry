import 'package:flutter/material.dart';
import 'package:hungry/features/topping/data/model/topping_model.dart';
import 'package:hungry/features/topping/presentation/view/widget/topping_item.dart';

class ToppingList extends StatelessWidget {
  const ToppingList({super.key, required this.model });

  final ToppingModel model;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.21,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.data!.length,
          itemBuilder: (context, index) {
            return ToppingItem(
              image: model.data![index].image!,
              title: model.data![index].name!,
            );
          }

      ),
    );
  }
}
