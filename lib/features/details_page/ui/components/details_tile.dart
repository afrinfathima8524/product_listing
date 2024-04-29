import 'package:flutter/material.dart';
import 'package:product_listing_using_bloc/features/details_page/bloc/details_bloc.dart';
import 'package:product_listing_using_bloc/model/product_details.dart';

class DetailsTile extends StatelessWidget {
  final ProductDetails productsDetail;
  final DetailsBloc detailsBloc;
  const DetailsTile(
      {super.key, required this.productsDetail, required this.detailsBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.network(productsDetail.image.toString()),
          ],
        )
      ],
    );
  }
}
