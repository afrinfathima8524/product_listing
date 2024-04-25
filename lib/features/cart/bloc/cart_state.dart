part of 'cart_bloc.dart';

@immutable
sealed class CartState {}
sealed class CartActionState extends CartState{}

final class CartInitial extends CartState {}

class CartSucessState extends CartState{
  final List<ProductsData> cartItems;
  CartSucessState({required this.cartItems});
}
class CartItemRemovedActionState extends CartActionState{}
// class CartIncrementState extends CartActionState{}
// class CartDecrementState extends CartActionState{}
// class CartTotalState extends CartState{
//   CartTotalState(double totalPrice);
// }

// class CartCountState extends CartState{
//   final int count;
//   CartCountState({this.count=1});
//   CartCountState copyWith({int? count}){
//     return CartCountState(count: count ?? this.count);
//   }
// }
// class CartQuantityActionState extends CartActionState{
//    int quantityCount =0;

// }
