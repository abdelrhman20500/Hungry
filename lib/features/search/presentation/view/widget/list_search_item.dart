import 'package:flutter/material.dart';
import 'package:hungry/features/search/data/model/search_model.dart';
import 'package:hungry/features/search/presentation/view/widget/search_item.dart';

class ListSearchItem extends StatelessWidget {
  const ListSearchItem({super.key, required this.model});

  final List<SearchData> model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10.0),
      child: GridView.builder(
          itemCount: model.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
            crossAxisSpacing: 14.0,
            childAspectRatio: 1.4 / 2.54,
          ),
          itemBuilder: (context, index){
            return SearchItem(
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
