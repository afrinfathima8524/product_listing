import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_listing_using_bloc/data/cart_items.dart';
import 'package:product_listing_using_bloc/model/product_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveEvent>(cartRemoveEvent);
    // on<CartTotal>(cartTotal);
  }
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSucessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveEvent(
      CartRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productsData);
    emit(CartItemRemovedActionState());
    emit(CartSucessState(cartItems: cartItems));
  }
}





   // on<QunatityIncrement>(qunatityIncrement);
    // on<QunatityDecrement>(qunatityDecrement);
    // on<CartQuantityActionState>(cartQuantityActionState);
    // _cartItemCountController = StreamController<int>();
    // cartItemCountStream = _cartItemCountController.stream;

  // Stream<CartState> mapEventToState(CartEvent event) async* {
  //   _cartItemCountController.add(cartItems.length);
  //   // ignore: invalid_use_of_visible_for_testing_member
  //   emit(CartSucessState(cartItems: cartItems));
  // }

  // @override
  // Future<void> close() {
  //   _cartItemCountController.close();
  //   return super.close();
  // }

// Stream<int> get itemCountStream async* {
//     yield cartItems.length;
//   }

//   Stream<CartState> mapEventToState(
//     CartEvent event,
//   ) async* {
//     if (event is CartInitialEvent) {
//       yield CartInitial();
//     } else if (event is CartRemoveEvent) {
//       cartItems.remove(event.productsData);
//       yield CartSucessState(cartItems: cartItems);
//     }
//   }
  // FutureOr<void> cartQuantityActionState(
  //     CartQuantityActionState event, Emitter<CartState> emit) {

  //     }
  
  // FutureOr<void> qunatityIncrement(
  //     QunatityIncrement event, Emitter<CartState> emit) {
  //   emit(state.copyWith(count: state.count++));
  // }

  // FutureOr<void> qunatityDecrement(
  //     QunatityDecrement event, Emitter<CartState> emit) {
  //           emit(state.copyWith(count: state.count--));
  //     }
  
  // FutureOr<void> cartTotal(event, Emitter<CartState> emit) {
  //   var productsData=ProductsData();
  //   final offerPrice=double.parse(productsData.offerPrice ?? '0');
  //   var totalPrice=productsData.quantity * offerPrice;
  //   emit(CartTotalState(totalPrice));
  // }