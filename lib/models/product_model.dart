class ProductModel{
  int id;
  String productName;
  double productPrice;
  String productImage;

  ProductModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productImage,
});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      productName: json["name"],
      productPrice: double.parse(json["price"].toString()),
      productImage: json["image"],
    );
  }
}