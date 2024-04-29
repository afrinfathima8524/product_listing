import 'package:product_listing_using_bloc/model/product_data.dart';

class ProductDetails extends ProductsData{
  int? id;
  String? name;
  String? category;
  String? offerPrice;
  double? price;
  String? image;
  double? rating;
  String? description;
  List<String>? features;
  

  ProductDetails(
      {this.id,
      this.name,
      this.category,
      this.offerPrice,
      this.price,
      this.image,
      this.rating,
      this.description,
      this.features});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    offerPrice = json['offerPrice'];
    price = json['price'];
    image = json['image'];
    rating = json['rating'];
    description = json['description'];
    features = json['features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['offerPrice'] = this.offerPrice;
    data['price'] = this.price;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['features'] = this.features;
    return data;
  }
}
