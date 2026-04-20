import 'package:ecommercer_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel myCategory;
   CategoryWidget({super.key,required this.myCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // circle,
        CircleAvatar(
          child: Center(child: Image.asset(myCategory.image))
        ),
        SizedBox(height: 5,),
        Text(myCategory.title)
        //title
      ],
    );
  }
}
