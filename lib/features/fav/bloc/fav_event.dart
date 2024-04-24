part of 'fav_bloc.dart';

@immutable
sealed class FavEvent {}
class FavInitialEvent extends FavEvent{}
class FavRemoveEvent extends FavEvent{
  final ProductsData productsData;
  FavRemoveEvent({required this.productsData});
}
