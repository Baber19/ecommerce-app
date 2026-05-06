import 'package:ecommercer_app/app_constants.dart';
import 'package:ecommercer_app/app_urls.dart';
import 'package:ecommercer_app/data/api_helper.dart';
import 'package:ecommercer_app/models/category_model.dart';
import 'package:ecommercer_app/ui/dashboard/bloc/category/cat_event.dart';
import 'package:ecommercer_app/ui/dashboard/bloc/category/cat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  APIHelper apiHelper;
  CategoryBloc({required this.apiHelper}) : super (CategoryInitialState()){
    on<FetchCategoryEvent>((state,emit)async {
      emit(CategoryLoadingState());

      try{
       var data = await apiHelper.getAPI(url: AppUrls.getCategoriesUrl);
       if(data["status"]){
         emit(CategorySuccessState(mCategories: CatDataModel.fromJson(data).data));
       }
       else{
         emit(CategoryErrorState(errorMsg: data["message"]));
       }
      }
      catch(e){
        emit(CategoryErrorState(errorMsg: e.toString()));

      }

    });
  }


}