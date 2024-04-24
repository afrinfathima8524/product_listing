import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_using_bloc/features/fav/bloc/fav_bloc.dart';
import 'package:product_listing_using_bloc/features/fav/ui/components/fav_tile.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  final FavBloc favBloc =FavBloc();
  @override
  void initState() {
    favBloc.add(FavInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
        title: const Text(
          "Favroited Items",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<FavBloc, FavState>(
        bloc: favBloc,
        listenWhen: (previous, current) => State is FavActionState,
        buildWhen: (previous, current) => State is! FavActionState,
        listener: (context, state) {},
        builder: (context, state) {
         switch (state.runtimeType) {
           case const (FavSucessState):
           final successState = state as FavSucessState;
             return ListView.builder(
               itemCount: successState.favItems.length,
               itemBuilder: (BuildContext context, int index) {
                 return FavTile(productsData: successState.favItems[index], favBloc: favBloc,);
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