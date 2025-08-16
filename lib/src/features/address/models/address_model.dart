class Address {
  final String id;
  final String street;
  final String city;
  final String state;
  final String zipCode;

  Address({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory Address.fromMap(Map<String, dynamic> data, String id) {
    return Address(
      id: id,
      street: data['street'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      zipCode: data['zipCode'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
    };
  }
}
