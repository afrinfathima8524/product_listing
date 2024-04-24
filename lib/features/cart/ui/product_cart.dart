import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_using_bloc/data/cart_items.dart';
import 'package:product_listing_using_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:product_listing_using_bloc/features/cart/ui/components/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
        title: Text(
          "Cart Items (${cartItems.length.toString()})",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartItemRemovedActionState) {
            const ScaffoldMessenger(
                child: SnackBar(content: Text("Removed From The Cart")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (CartSucessState):
              final sucessState = state as CartSucessState;
              return ListView.builder(
                itemCount: sucessState.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartTile(
                    productsData: sucessState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
              );
            default:
          }
          return Container();
        },
      ),
    );
  }
}
