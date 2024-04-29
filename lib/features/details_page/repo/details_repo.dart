import 'dart:convert';

import 'package:product_listing_using_bloc/model/product_details.dart';
import 'package:http/http.dart' as http;

class DetailsRepo{
 static Future<List<ProductDetails>> fetchProductDetails() async{
  var client=http.Client();
  List<ProductDetails> products=[];
  try {
    var response = await client.get(Uri.parse('https://mocki.io/v1/2d3bed9f-fcde-48e0-80ac-fc4615d7f303'));
    List result =jsonDecode(response.body);
    for (var i = 0; i < result.length; i++) {
      ProductDetails productsDetail =ProductDetails.fromJson(result[i] as Map<String,dynamic>);
      products.add(productsDetail);
    }
    return products;
  } catch (e) {
    return[];
  }
}
}