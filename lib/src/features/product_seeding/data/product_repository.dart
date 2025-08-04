// 
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/product_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    await _firestore
        .collection('products')
        .doc(product.id)
        .set(product.toMap());
  }


  Future<List<Product>> fetchProductsBySection(String key) async {
    try {
      final snapshot = await _firestore
          .collection('products')
          .where(key, isEqualTo: true)
          .get();

      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Error fetching $key products: $e');
      return [];
    }
  }

  Future<List<Product>> fetchAllProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();

      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Error fetching all products: $e');
      return [];
    }
  }
 }