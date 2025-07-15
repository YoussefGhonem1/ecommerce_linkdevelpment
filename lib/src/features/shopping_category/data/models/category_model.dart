import 'package:ecommerce_app/core/utils/app_images.dart';

class CategoryModel {
  final String title;
  final String imagePath;
  final double imageSize;
  final double fontSize;

  CategoryModel({
    required this.title,
    required this.imagePath,
    required this.imageSize,
    required this.fontSize,
  });


  static List<CategoryModel> categories = [
  CategoryModel(title: "Hoodies", imagePath: Assets.imagesCategory1, imageSize: 40, fontSize: 16),
  CategoryModel(title: "Accessories", imagePath: Assets.imagesCategory2, imageSize: 40, fontSize: 16),
  CategoryModel(title: "Shorts", imagePath: Assets.imagesCategory3, imageSize: 40, fontSize: 16),
  CategoryModel(title: "Shoes", imagePath: Assets.imagesCategory4, imageSize: 40, fontSize: 16),
  CategoryModel(title: "Bags", imagePath: Assets.imagesCategory5, imageSize: 40, fontSize: 16),
];
}