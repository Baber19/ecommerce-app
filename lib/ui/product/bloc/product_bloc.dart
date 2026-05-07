import 'package:ecommercer_app/ui/product/bloc/product_event.dart';
import 'package:ecommercer_app/ui/product/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc(): super(ProductInitialState(){
    on<>(){}
  })
}