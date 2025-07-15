class CategoryModel {
  final String title;
  final String imagePath;

  CategoryModel({
    required this.title,
    required this.imagePath,
  });


  List<CategoryModel> categories = [
  CategoryModel(title: "Hoodies", imagePath: ""),
  CategoryModel(title: "Accessories", imagePath: ""),
  CategoryModel(title: "Shorts", imagePath: ""),
  CategoryModel(title: "Shoes", imagePath: ""),
  CategoryModel(title: "Bags", imagePath: ""),
];
}