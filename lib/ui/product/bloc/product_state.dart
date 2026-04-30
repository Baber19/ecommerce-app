import 'package:ecommercer_app/models/product_model.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;
  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState {
  final String errorMsg;
  ProductErrorState({required this.errorMsg});
}
