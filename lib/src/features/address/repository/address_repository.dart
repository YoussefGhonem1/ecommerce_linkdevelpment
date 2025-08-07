import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/src/features/address/models/address_model.dart';

class AddressRepository {
  final _db = FirebaseFirestore.instance;

Future<List<Address>> getAddresses(String userId) async {
  final snapshot = await _db
      .collection('users')
      .doc(userId)
      .collection('addresses')
      .get();

  return snapshot.docs
      .map((doc) => Address.fromMap(doc.data(), doc.id))
      .toList();
}
 Future<void> addAddress(String userId, Address address) async {
  final addressRef = _db
      .collection('users')
      .doc(userId)
      .collection('addresses')
      .doc();

  await addressRef.set(address.toMap());
}

Future<void> updateAddress(String userId, Address address) async {
  final addressRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('addresses')
      .doc(address.id);

  await addressRef.update(address.toMap());
}

Future<void> deleteAddress(String userId, String addressId) async {
  final addressRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('addresses')
      .doc(addressId);

  await addressRef.delete();
}


}
