import 'package:ecommercer_app/data/category_list.dart';
import 'package:ecommercer_app/data/products_list.dart';
import 'package:ecommercer_app/utils/images.dart';
import 'package:ecommercer_app/widgets/category_widget.dart';
import 'package:ecommercer_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dummyCategories.length,
                itemBuilder: (_,index){
                  final category = dummyCategories[index];
              return  CategoryWidget(myCategory: category);
            },
              separatorBuilder: (context, index) => SizedBox(width: 10,),

            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: dummyProducts.length,
              itemBuilder: (_, index) {
                final product = dummyProducts[index];
                return ProductCard(myProduct: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
