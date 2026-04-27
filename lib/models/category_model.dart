class CategoryModel{
  String catTitle;
  String catImage;

  CategoryModel({required this.catTitle,required this.catImage});

  // factory CategoryModel.fromMap(Map<String,dynamic> json){
  //   return CategoryModel(catTitle: catTitle, catImage: catImage)
  // }

}

List<CategoryModel> mCategories = [
  CategoryModel(
    catTitle: "Shoes",
    catImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt0dIKkkJJK_7SQ0c2UKxrlH26SZVOHd2lkQ&s",
  ),
  CategoryModel(
    catTitle: "Beauty",
    catImage: "https://d2ati23fc66y9j.cloudfront.net/category-pages/sub_category-174021874143.jpg",
  ),
  CategoryModel(
    catTitle: "Women's Fashion",
    catImage: "https://maison-novague.com/wp-content/uploads/2024/07/classic-fashion-styleTH2.jpg",
  ),
  CategoryModel(
    catTitle: "Jewelery",
    catImage: "https://i.pinimg.com/736x/4b/54/29/4b5429295bacf9904171a695c5bd616e.jpg",
  ),
  CategoryModel(
    catTitle: "Mens Fashion",
    catImage: "https://i.pinimg.com/474x/56/5d/18/565d1841748d24275f5707d6c7043079.jpg",
  ),
];