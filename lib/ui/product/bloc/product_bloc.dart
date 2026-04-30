import 'package:ecommercer_app/data/api_helper.dart';
import 'package:ecommercer_app/ui/product/bloc/product_event.dart';
import 'package:ecommercer_app/ui/product/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../app_constants.dart';
import '../../../app_urls.dart';
import '../../../models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}) : super(ProductInitialState()){
    on<FetchProductEvent>((event,emit) async{
      emit(ProductLoadingState());
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString(AppConstants.USER_TOKEN);

        dynamic data = await apiHelper.postApi(
          url: AppUrls.getProductsUrl,

        );

        if (data["status"] == true && data["data"] != null) {

          List<ProductModel> products = (data["data"] as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();

          emit(ProductLoadedState(products: products));

        } else {
          emit(ProductErrorState(errorMsg: data["message"]));
        }

      } catch (e) {
        emit(ProductErrorState(errorMsg: e.toString()));
      }
    });

  }
}