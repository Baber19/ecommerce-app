import 'package:ecommercer_app/app_urls.dart';
import 'package:ecommercer_app/data/api_helper.dart';
import 'package:ecommercer_app/ui/product/bloc/product_event.dart';
import 'package:ecommercer_app/ui/product/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  APIHelper apiHelper;
  ProductBloc({required this.apiHelper}) : super(ProductInitialState()) {
    on<FetchProductEvent>((state, emit) async {
      emit(ProductLoadingState());
      try {
        var data = await apiHelper.postAPI(url: AppUrls.getProductsUrl);
        if (data['status']) {
          List<ProductModel> allProducts = (data['data'] as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();

          emit(ProductLoadedState(products: allProducts));
        } else {
          emit(ProductErrorState(errorMsg: data["message"]));
        }
      } catch (e) {
        emit(ProductErrorState(errorMsg: e.toString()));
      }
    });
  }
}
