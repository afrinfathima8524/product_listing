import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_using_bloc/features/cart/ui/product_cart.dart';
import 'package:product_listing_using_bloc/features/details_page/ui/details_page.dart';
import 'package:product_listing_using_bloc/features/fav/ui/product_fav.dart';
import 'package:product_listing_using_bloc/features/home/bloc/home_bloc.dart';
import 'package:product_listing_using_bloc/features/home/ui/components/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    homeBloc.add(ProductInitialFetchEvent());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "SkinCare Revelotion",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink.shade300,
        actions: [
          IconButton(
            onPressed: () {
              homeBloc.add(FavPageNavigateEvent());
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              homeBloc.add(CartPageNavigateEvent());
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is ProductNavigateToCartPage) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          } else if (state is ProductNavigateToFavPage) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FavPage()));
          }
          else if (state is ProductNavigateToDetailsPage) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DetailsPage()));
          }
          //  else if (state is ProductCartedActionState) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text("Product Carted")));
          // }
          // else if (state is FavPageNavigateEvent) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text("Product Added to Favroites")));
          // }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductLoadingState:
              return Scaffold(
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ProductFetchSucessState:
              final successState = state as ProductFetchSucessState;
              return LayoutBuilder(builder: (context, constraints) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 760 ? 4 :2,
                    childAspectRatio: 1
                  ),
                  itemCount: successState.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    var clickedProduct=successState.products[index];
                    return GestureDetector(
                      onTap: () {
                        homeBloc.add(ProductNavigateToDetailsPageEvent(clickedProduct: clickedProduct));
                      },
                      child: ProductTile(
                        productsData: clickedProduct,
                        homeBloc: homeBloc,
                      ),
                    );
                  },
                );
              },);
            default:
              return Container();
          }
        },
      ),
    );
  }
}
