import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../product_seeding/data/product_model.dart';

class FavouriteNotifier extends StateNotifier<List<Product>> {
  FavouriteNotifier(this.ref) : super([]);

  final Ref ref;

  Future<void> loadFavourites() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('favourites')
        .get();

    state = snapshot.docs.map((d) => Product.fromMap(d.data(), d.id)).toList();
  }

  Future<void> toggleFavourite(Product product) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final favRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('favourites')
        .doc(product.id);

    final isFav = state.any((p) => p.id == product.id);

    if (isFav) {
      await favRef.delete();
      state = state.where((p) => p.id != product.id).toList();
    } else {
      final productWithUser = product.copyWith(userId: user.uid);
      await favRef.set(productWithUser.toMap());
      state = [...state, productWithUser];
    }
    await loadFavourites();
  }

  bool isFavourite(Product product) => state.any((p) => p.id == product.id);
}

final favouriteProductsProvider =
    StateNotifierProvider<FavouriteNotifier, List<Product>>(
  (ref) => FavouriteNotifier(ref)..loadFavourites(),
);
