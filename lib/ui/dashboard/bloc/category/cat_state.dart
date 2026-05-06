import '../../../../models/category_model.dart';

abstract class CategoryState{}

class CategoryInitialState extends CategoryState{}
class CategoryLoadingState extends CategoryState{}
class CategorySuccessState extends CategoryState{
  List<CatModel>? mCategories;

  CategorySuccessState({required this.mCategories});
}
class CategoryErrorState extends CategoryState{
  String errorMsg;
  CategoryErrorState({required this.errorMsg});
}
