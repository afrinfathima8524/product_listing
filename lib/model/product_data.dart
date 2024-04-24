class ProductsData {
  int? id;
  String? name;
  String? category;
  String? offerPrice;
  double? price;
  String? image;
  late int quantity;

  ProductsData({
    this.id,
    this.name,
    this.category,
    this.offerPrice,
    this.price,
    this.image,
  }) {
    quantity = 0;
  }

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    offerPrice = json['offerPrice'];
    price = json['price'];
    image = json['image'];
    quantity = 0;
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

  ProductsData copyWith({
    int? id,
    String? name,
    String? category,
    String? offerPrice,
    double? price,
    String? image,
    int? quantity,
  }) {
    return ProductsData(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      offerPrice: offerPrice ?? this.offerPrice,
      price: price ?? this.price,
      image: image ?? this.image,
    )..quantity = quantity ?? this.quantity;
  }
}
