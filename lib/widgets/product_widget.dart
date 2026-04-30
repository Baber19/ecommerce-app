import 'package:flutter/material.dart';
import 'package:ecommercer_app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.grey.shade300,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ❤️ Favorite icon
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border, color: Colors.orange),
          ),

          /// 🖼 Image
          Center(
            child: Image.network(
              product.productImage,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 10),

          /// 📦 Name
          Text(
            product.productName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 5),

          /// 💰 Price
          Text(
            "\$${product.productPrice}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 5),

          /// 🎨 Color dots (dummy)
          Row(
            children: [
              _colorDot(Colors.black),
              _colorDot(Colors.grey),
              _colorDot(Colors.blue),
              _colorDot(Colors.orange),
            ],
          )
        ],
      ),
    );
  }

  Widget _colorDot(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}