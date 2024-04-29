import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_listing_using_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:product_listing_using_bloc/model/product_data.dart';

class CartTile extends StatefulWidget {
  final ProductsData productsData;
  final CartBloc cartBloc;
  const CartTile(
      {super.key, required this.productsData, required this.cartBloc});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.productsData.quantity * double.parse(widget.productsData.offerPrice ?? '0');
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
              Image.network(widget.productsData.image.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productsData.name.toString(),
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
                            '${widget.productsData.category}',
                            style: GoogleFonts.inter(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ ${widget.productsData.price}',
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
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
                              Text('\$${totalPrice.toStringAsFixed(2)}'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (widget.productsData.quantity > 1) {
                                      widget.productsData.quantity--;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove)),
                            Text("${widget.productsData.quantity}"),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.productsData.quantity++;
                                  });
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.cartBloc.add(CartRemoveEvent(
                              productsData: widget.productsData));
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 30,
                        ),
                        color: Colors.pink,
                      ),
                    ],
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
