import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_listing_using_bloc/data/fav_items.dart';
import 'package:product_listing_using_bloc/features/home/bloc/home_bloc.dart';
import 'package:product_listing_using_bloc/model/product_data.dart';

class ProductTile extends StatefulWidget {
  final ProductsData productsData;
  final HomeBloc homeBloc;
  const ProductTile(
      {super.key, required this.productsData, required this.homeBloc});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.pink.shade400),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: NetworkImage(productsData.image.toString(),),fit: BoxFit.cover)),
            child: Column(
              children: [
                Center(
                    child: Image.network(
                  widget.productsData.image.toString(),
                  height: 65,
                )),
                Text(widget.productsData.name.toString(),
                    style: GoogleFonts.inter(fontSize: 20)),
                Text(
                  '\$${widget.productsData.offerPrice}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.homeBloc.add(FavButtonClickedEvent(
                                clickedProduct: widget.productsData));
                          });
                        },
                        icon: favItems.contains(widget.productsData)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.pink[400],
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.pink[400],
                              )),
                    MaterialButton(
                      onPressed: () {
                        widget.homeBloc.add(CartButtonClickedEvent(
                            clickedProduct: widget.productsData));
                      },
                      color: Colors.pink.shade400,
                      child: const Text(
                        "Add To Bag",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
