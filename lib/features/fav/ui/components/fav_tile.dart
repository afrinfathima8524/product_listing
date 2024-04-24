import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_listing_using_bloc/features/fav/bloc/fav_bloc.dart';
import 'package:product_listing_using_bloc/model/product_data.dart';

class FavTile extends StatelessWidget {
  final ProductsData productsData;
  final FavBloc favBloc;
  const FavTile({super.key, required this.productsData, required this.favBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink.shade400),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(productsData.image.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsData.name.toString(),
                        style: GoogleFonts.inter(fontSize: 22),
                      ),
                      Row(
                        children: [
                          Text(
                            "Category: ",
                            style: GoogleFonts.inter(
                                fontSize: 18, color: Colors.grey[500]),
                          ),
                          Text(
                            '${productsData.category.toString()}',
                            style: GoogleFonts.inter(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ ${productsData.price}',
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Offer Price",
                                style: GoogleFonts.dmSerifDisplay(
                                    fontSize: 15, color: Colors.green),
                              ),
                              Text('\$${productsData.offerPrice}'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      favBloc.add(FavRemoveEvent(productsData: productsData));
                    },
                    icon: const Icon(Icons.favorite,size: 30,),
                    color: Colors.pink,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
