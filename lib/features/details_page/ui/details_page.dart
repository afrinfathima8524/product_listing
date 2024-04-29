import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_using_bloc/features/details_page/bloc/details_bloc.dart';
import 'package:product_listing_using_bloc/features/details_page/ui/components/details_tile.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final DetailsBloc detailsBloc=DetailsBloc();
  @override
  void initState() {
    detailsBloc.add(DetailsInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Property Details"),
      ),
      body: BlocConsumer<DetailsBloc, DetailsState>(
        bloc: detailsBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is DetailsActionState,
        buildWhen: (previous, current) => current is! DetailsActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case (DetailsSucessState):
              final detailsSucessState = state as DetailsSucessState;
              ListView.builder(
                itemCount: detailsSucessState.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return DetailsTile(
                    productsDetail:detailsSucessState.products[index],
                    detailsBloc:detailsBloc
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
