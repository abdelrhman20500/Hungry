import 'package:flutter/material.dart';
import 'package:hungry/features/favorite/presentation/view/widget/item_favorite.dart';
import '../../../data/model/fav_model.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({super.key, required this.model});

  final FavModel model;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: model.data!.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          childAspectRatio: 1.4 / 2.46,
        ),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: ItemFavorite(
              id: model.data![index].id!,
              image: model.data![index].image!,
              title: model.data![index].name!,
              description: model.data![index].description!,
              price: model.data![index].price!,
              rating: model.data![index].rating!,
            ),
          );
        }
    );
  }
}
