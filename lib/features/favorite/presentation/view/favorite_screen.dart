import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/favorite/presentation/view/widget/favorite_grid_view.dart';
import 'package:hungry/features/favorite/presentation/view_manager/favorite_cubit.dart';
import 'package:hungry/features/favorite/presentation/view_manager/favorite_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoriteFailure) {
          return Center(child: Text("Error: ${state.errMessage}"));
        } else if (state is FavoriteEmpty) {
          return const Center(
            child: Text(
              "Favorites is Empty",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          );
        } else if (state is FavoriteSuccess) {
          return FavoriteGridView(model: state.favModel);
        }
        return const SizedBox();
      },
    );
  }
}
