
import 'package:ecommerce_app/generated/assets.dart';

class CategoryModel {
  final String title;
  final String imagePath;


  CategoryModel({
    required this.title,
    required this.imagePath,

  });


  static List<CategoryModel> categories = [
  CategoryModel(title: "Hoodies", imagePath: Assets.imagesCategory1),
  CategoryModel(title: "Accessories", imagePath: Assets.imagesCategory2),
  CategoryModel(title: "Shorts", imagePath: Assets.imagesCategory3),
  CategoryModel(title: "Shoes", imagePath: Assets.imagesCategory4),
  CategoryModel(title: "Bags", imagePath: Assets.imagesCategory5),
];
}