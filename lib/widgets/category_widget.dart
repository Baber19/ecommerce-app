import 'package:ecommercer_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryWidget({super.key,required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Image.network(categoryModel.catImage),
        ),
        SizedBox(height: 5,),
        Text(categoryModel.catTitle)
      ],
    );
  }
}
