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
    catImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDwzDBvZLhMM7HfWhB9-LrZfJ-OxaUg321Q&s",
  ),
  CategoryModel(
    catTitle: "Jewelery",
    catImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQepTfkO-SMGwTD-OPOi1ZJ5LD3qCWKdp2hwQ&s",
  ),
  CategoryModel(
    catTitle: "Men's Fashion",
    catImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzs3u51Fh2RHYmeafoZ9jA2qCB-iqGDOHcRw&s",
  ),
  CategoryModel(
    catTitle: "Women's Fashion",
    catImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDwzDBvZLhMM7HfWhB9-LrZfJ-OxaUg321Q&s",
  ),
  CategoryModel(
    catTitle: "Beauty",
    catImage: "https://d2ati23fc66y9j.cloudfront.net/category-pages/sub_category-174021874143.jpg",
  ),
];