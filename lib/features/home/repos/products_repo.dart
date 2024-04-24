import 'dart:convert';

import 'package:product_listing_using_bloc/model/product_data.dart';
import 'package:http/http.dart' as http;
class productRepo{
  static Future<List<ProductsData>> fetchProduct() async{
    var client=http.Client();
    List<ProductsData> products =[];
    try{
      var response = await client.get(Uri.parse('https://mocki.io/v1/62f420f2-53a9-4011-a25c-3da0667a29a2'));
      List result = jsonDecode(response.body);
      for(int i=0;i<result.length;i++){
        ProductsData product=ProductsData.fromJson(result[i] as Map<String,dynamic>);
        products.add(product);
      }
      return products;
    }catch(e){
      print(e.toString());
      return[];
    }
  }
}

// where i have stopped is i gotten the products from repo and need to design the ui need to have fav and cart page have to add the product to it tooapp bar action to be done and builder action to be done in else if{}