class ProductsData {
  int? id;
  String? name;
  String? category;
  String? offerPrice;
  double? price;
  String? image;

  ProductsData(
      {this.id,
      this.name,
      this.category,
      this.offerPrice,
      this.price,
      this.image});

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    offerPrice = json['offerPrice'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['offerPrice'] = this.offerPrice;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
