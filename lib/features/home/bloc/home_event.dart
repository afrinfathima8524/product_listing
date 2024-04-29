part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ProductInitialFetchEvent extends HomeEvent{}
// class DetailsPageClickedEvent extends HomeEvent{
//   final ProductsData clickedProduct;
//   DetailsPageClickedEvent({required this.clickedProduct});
// }
class FavButtonClickedEvent extends HomeEvent{
 final ProductsData clickedProduct;
  FavButtonClickedEvent({required this.clickedProduct});
}
class CartButtonClickedEvent extends HomeEvent{
  final ProductsData clickedProduct;
  CartButtonClickedEvent({required this.clickedProduct});
}
class FavPageNavigateEvent extends HomeEvent{}
class CartPageNavigateEvent extends HomeEvent{}
class ProductNavigateToDetailsPageEvent extends HomeEvent{
  final ProductsData clickedProduct;
  ProductNavigateToDetailsPageEvent({required this.clickedProduct});
}
