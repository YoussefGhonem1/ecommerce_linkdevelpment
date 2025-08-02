import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> fetchCategories() async {
    final snapshot = await _db.collection('categories').get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromMap(doc.data()))
        .toList();
  }
}
