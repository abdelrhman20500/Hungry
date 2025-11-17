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

  // Local state management for efficiency
  Set<String> favoriteProductIds = {};
  FavModel? currentFavoriteModel; // Stores the entire list model

  // ------------------------- STATUS CHECKER -------------------------

  /// Checks if a product ID is in the local set.
  bool isFavorite(int productId) {
    return favoriteProductIds.contains(productId.toString());
  }

  // ------------------------- GET FAVORITE (LIST) -------------------------

// Inside FavoriteCubit
  Future<void> getFavorite() async {
    if (currentFavoriteModel == null) {
      emit(FavoriteLoading());
    }

    if (isClosed) return;

    var result = await favUseCase.call(const NoParameters());

    if (isClosed) return;

    result.fold((e) {
      if (currentFavoriteModel == null) {
        emit(FavoriteFailure(errMessage: e.message));
      }
    }, (favModel) {
      currentFavoriteModel = favModel;

      // ✅ لو القائمة فاضية
      if (favModel.data == null || favModel.data!.isEmpty) {
        emit(FavoriteEmpty());
      } else {
        emit(FavoriteSuccess(favModel: favModel));
      }
    });
  }

  // Future<void> getFavorite() async {
  //   // ✅ FIX: Only emit FavoriteLoading if the list has not been loaded before (i.e., for initial fetch).
  //   // If currentFavoriteModel is not null, we have data to display, so run the refresh silently.
  //   if (currentFavoriteModel == null) {
  //     emit(FavoriteLoading());
  //   }
  //
  //   if (isClosed) return;
  //
  //   var result = await favUseCase.call(const NoParameters());
  //
  //   if (isClosed) return;
  //
  //   result.fold((e) {
  //     // ... (Failure logic) ...
  //     if (currentFavoriteModel == null) {
  //       emit(FavoriteFailure(errMessage: e.message));
  //     }
  //   }, (favModel) {
  //     // ... (Update currentFavoriteModel and favoriteProductIds set) ...
  //
  //     emit(FavoriteSuccess(favModel: favModel));
  //   });
  // }
  // ------------------------- TOGGLE FAVORITE ACTION -------------------------

  Future<void> toggleFavorite({required int id}) async {
    final productIdString = id.toString();
    final wasFavorite = isFavorite(id);

    // 1. Emit loading state for UI feedback
    // emit(AddOrRemoveFavLoading());

    // 2. Perform API call
    var result = await addOrRemoveFavUseCase.call(id);

    if (isClosed) return;

    result.fold((e) {
      // 3. On Failure: Emit failure state
      emit(AddOrRemoveFavFailure(errMessage: e.message));
    }, (addOrRemoveFavModel) {
      // 4. On Success: Update local state for the icon
      if (wasFavorite) {
        favoriteProductIds.remove(productIdString);
      } else {
        favoriteProductIds.add(productIdString);
      }

      // 5. 🎯 INSTANT UI FIX: Emit dedicated state to trigger icon redraw
      emit(FavoriteStatusUpdated());

      // Emit Success state for SnackBar/Toast notification
      emit(AddOrRemoveFavSuccess(addOrRemoveFavModel: addOrRemoveFavModel));

      // 6. Force the list to refresh for screens showing the list of favorites
      // This is necessary because the main list needs the full product details from the server.
      getFavorite();
    });
  }
}
