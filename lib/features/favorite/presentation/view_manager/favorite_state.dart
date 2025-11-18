import 'package:hungry/features/favorite/data/model/add_or_remove_fav_model.dart';
import 'package:hungry/features/favorite/data/model/fav_model.dart';


abstract class FavoriteState{}
class FavoriteInitial extends FavoriteState{}

/// get Favorite States
class FavoriteLoading extends FavoriteState{}
class FavoriteEmpty extends FavoriteState {}
class FavoriteFailure extends FavoriteState{
  final String errMessage;
  FavoriteFailure({required this.errMessage});
}
class FavoriteSuccess extends FavoriteState{
  final FavModel favModel;
  FavoriteSuccess({required this.favModel});
}
class FavoriteStatusUpdated extends FavoriteState{}

/// add Or Remove Favorites...
class ToggleLoading extends FavoriteState{}
class ToggleFavFailure extends FavoriteState{
  final String errMessage;
  ToggleFavFailure({required this.errMessage});
}
class ToggleFavSuccess extends FavoriteState{
  final AddOrRemoveFavModel addOrRemoveFavModel;
  ToggleFavSuccess({required this.addOrRemoveFavModel});
}
