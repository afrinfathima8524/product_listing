part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
sealed class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class ProductLoadingState extends HomeState{}
class ProductErrorState extends HomeState{}
class ProductFetchSucessState extends HomeState{
  final List<ProductsData> products;
  ProductFetchSucessState({required this.products});
}
class ProductNavigateToCartPage extends HomeActionState{}
class ProductNavigateToFavPage extends HomeActionState{}

class ProductCartedActionState extends HomeActionState{}
class ProductFavroitedActionState extends HomeActionState{}

