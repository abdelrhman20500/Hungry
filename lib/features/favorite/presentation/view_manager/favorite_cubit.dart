import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/features/favorite/data/model/fav_model.dart';
import 'package:hungry/features/favorite/domain/use_case/add_ore_remove_fav_use_case.dart';
import 'package:hungry/features/favorite/domain/use_case/fav_use_case.dart';
import 'package:hungry/features/favorite/presentation/view_manager/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favUseCase, this.addOrRemoveFavUseCase)
      : super(FavoriteInitial());

  final FavUseCase favUseCase;
  final AddOrRemoveFavUseCase addOrRemoveFavUseCase;

  static FavoriteCubit get(context) => BlocProvider.of(context);

  FavModel? currentFavoriteModel;
  Set<String> favoriteProductIds = {}; // نخزن الـ IDs هنا

  /// Get Favorites
  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    var result = await favUseCase.call(const NoParameters());
    result.fold((e) {
      emit(FavoriteFailure(errMessage: e.message));
    }, (favModel) {
      if (favModel.data == null || favModel.data!.isEmpty) {
        emit(FavoriteEmpty());
      } else {
        currentFavoriteModel = favModel;
        emit(FavoriteSuccess(favModel: favModel));
      }
    });
  }

  Future<void> toggleFavorite({required int id}) async {
    emit(ToggleLoading());
    var result = await addOrRemoveFavUseCase.call(id);

    result.fold((e) {
      emit(ToggleFavFailure(errMessage: e.message));
    }, (addOrRemoveFavModel) {
      final productIdString = id.toString();
      if (favoriteProductIds.contains(productIdString)) {
        favoriteProductIds.remove(productIdString);
      } else {
        favoriteProductIds.add(productIdString);
      }
      emit(ToggleFavSuccess(addOrRemoveFavModel: addOrRemoveFavModel));
      getFavorites(); // تحديث القائمة من السيرفر
    });
  }
  bool isFavorite(int productId) {
    return favoriteProductIds.contains(productId.toString());
  }
}
