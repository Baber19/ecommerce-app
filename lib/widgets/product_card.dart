import 'package:ecommercer_app/models/product_model.dart';
import 'package:ecommercer_app/data/products_list.dart';
import 'package:ecommercer_app/utils/images.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel myProduct;
  const ProductCard({super.key,required this.myProduct});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.teal
        ),
        child: Column(
          children: [
            //image,
              Image.asset(myProduct.image,fit: BoxFit.cover,height: 100,),
            //title,
            Text(myProduct.title),

            //row(price+list of colors)
            Row(
              children: [
                Text("${myProduct.price}")
                
              ],
            )
          ],
        ),
      );
  }
}
