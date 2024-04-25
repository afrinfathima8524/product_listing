part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartRemoveEvent extends CartEvent{
  final ProductsData productsData;
 CartRemoveEvent({required this.productsData});
}

// class CartTotal extends CartEvent{}

// class QunatityIncrement extends CartEvent{
//    final int quantityCount;
//   QunatityIncrement({required this.quantityCount});
// }
// class QunatityDecrement extends CartEvent{
//     final int quantityCount;
//   QunatityDecrement({required this.quantityCount});
// }

// class CartCountEvent extends CartEvent{}

// class CartQuantityActionState extends CartEvent{
//   final ProductsData productsData;
//   final int quantityCount;
//   CartQuantityActionState(this.quantityCount, {required this.productsData});
// }
