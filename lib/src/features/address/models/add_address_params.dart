import 'package:ecommerce_app/src/features/address/models/address_model.dart';

class AddressParams {
  final String userId;
  final Address address;

  AddressParams({
    required this.userId, 
    required this.address
    });
}
