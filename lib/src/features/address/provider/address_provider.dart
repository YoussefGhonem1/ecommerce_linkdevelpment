import 'package:ecommerce_app/src/features/address/models/add_address_params.dart';
import 'package:ecommerce_app/src/features/address/models/address_model.dart';
import 'package:ecommerce_app/src/features/address/models/delete_address_params.dart';
import 'package:ecommerce_app/src/features/address/repository/address_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressRepositoryProvider = Provider((ref) => AddressRepository());

final addressProvider = FutureProvider.family<List<Address>, String>((
  ref,
  userId,
) async {
  final repo = ref.read(addressRepositoryProvider);
  return await repo.getAddresses(userId);
});

final addAddressProvider = FutureProvider.family<void, AddressParams>((
  ref,
  params,
) async {
  final repo = ref.read(addressRepositoryProvider);
  await repo.addAddress(params.userId, params.address);
});

final updateAddressProvider = FutureProvider.family<void, AddressParams>((
  ref,
  params,
) async {
  final repo = ref.read(addressRepositoryProvider);
  await repo.updateAddress(params.userId, params.address);
});

final deleteAddressProvider = FutureProvider.family<void, DeleteAddressParams>((ref, params) async {
  final repo = ref.read(addressRepositoryProvider);
  await repo.deleteAddress(params.userId, params.addressId);
});
