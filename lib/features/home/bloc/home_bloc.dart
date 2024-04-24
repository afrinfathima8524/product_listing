import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_listing_using_bloc/data/cart_items.dart';
import 'package:product_listing_using_bloc/data/fav_items.dart';
import 'package:product_listing_using_bloc/model/product_data.dart';
import 'package:product_listing_using_bloc/features/home/repos/products_repo.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ProductInitialFetchEvent>(productInitialFetchEvent);
    on<FavPageNavigateEvent>(favPageNavigateEvent);
    on<CartPageNavigateEvent>(cartPageNavigateEvent);
    on<FavButtonClickedEvent>(favButtonClickedEvent);
    on<CartButtonClickedEvent>(cartButtonClickedEvent);
  }

  Future<FutureOr<void>> productInitialFetchEvent(
      ProductInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(ProductLoadingState());
    List<ProductsData> products = await productRepo.fetchProduct();
    emit(ProductFetchSucessState(products: products));
  }

  FutureOr<void> favPageNavigateEvent(
      FavPageNavigateEvent event, Emitter<HomeState> emit) {
    emit(ProductNavigateToFavPage());
  }

  FutureOr<void> cartPageNavigateEvent(
      CartPageNavigateEvent event, Emitter<HomeState> emit) {
    emit(ProductNavigateToCartPage());
  }

  FutureOr<void> favButtonClickedEvent(
      FavButtonClickedEvent event, Emitter<HomeState> emit) {
    if (!favItems.contains(event.clickedProduct)) {
      favItems.add(event.clickedProduct);
    }else{
      favItems.remove(event.clickedProduct);
    }
    emit(ProductFavroitedActionState());
  }

  FutureOr<void> cartButtonClickedEvent(
      CartButtonClickedEvent event, Emitter<HomeState> emit) {
        if(!cartItems.contains(event.clickedProduct)){
          cartItems.add(event.clickedProduct);
        }
    emit(ProductCartedActionState());
  }
}
