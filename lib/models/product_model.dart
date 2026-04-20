import 'dart:ui';

class ProductModel{
  final String title;
 final double price;
 final String image;
 final List<Color> colors;

 ProductModel({
    required this.title,
   required this.price,
   required this.image,
   required this.colors,
});
}