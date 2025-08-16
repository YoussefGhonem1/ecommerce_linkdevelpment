class CategoryModel {
  final String title;
  final String imagePath;

  CategoryModel({
    required this.title,
    required this.imagePath,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['name'] ?? '',      
      imagePath: map['imageUrl'] ?? '', 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': title,
      'imageUrl': imagePath,
    };
  }
}
