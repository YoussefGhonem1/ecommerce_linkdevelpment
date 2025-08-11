import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final cardsStreamProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) return const Stream.empty();

  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('cards')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => {...doc.data(), 'id': doc.id}).toList());
});

final cardRepositoryProvider = Provider<CardRepository>((ref) {
  return CardRepository();
});

class CardRepository {
  final _db = FirebaseFirestore.instance;
  final _uid = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addOrUpdateCard(String? id, Map<String, dynamic> data) async {
    if (_uid == null) return;

    final ref = _db.collection('users').doc(_uid).collection('cards');
    if (id == null) {
      await ref.add(data);
    } else {
      await ref.doc(id).update(data);
    }
  }
}
