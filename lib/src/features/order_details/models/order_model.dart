class Order {
  final String id;
  final List<String> items;
  final String status;
  final DateTime placedDate;
  final DateTime confirmedDate;
  final DateTime shippedDate;
  final DateTime deliveredDate;
  final String address;
  final String phone;

  Order({
    required this.id,
    required this.items,
    required this.status,
    required this.placedDate,
    required this.confirmedDate,
    required this.shippedDate,
    required this.deliveredDate,
    required this.address,
    required this.phone,
  });

 

}
Order testOrder = Order(
  id: "#456765",
  items: ["Item 1", "Item 2", "Item 3", "Item 4"],
  status: "Shipped",
  placedDate: DateTime(2024, 5, 28),
  confirmedDate: DateTime(2024, 5, 28),
  shippedDate: DateTime(2024, 5, 28),
  deliveredDate: DateTime(2024, 6, 1),
  address: "2715 Ash Dr. San Jose, South Dakota 83475",
  phone: "121-226-7890",
);