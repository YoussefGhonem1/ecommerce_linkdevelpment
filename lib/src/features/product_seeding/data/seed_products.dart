import 'product_model.dart';
import 'product_repository.dart';
import 'package:ecommerce_app/src/features/product_seeding/utils/generate_slug.dart';

final sampleProducts = [
  Product(
    id: generateSlug("Men's Harringiton Jacket"),
    name: "Men's Harringiton Jacket",

    currentPrice: 148.00,
    originalPrice: 200.00,
    images:[ "https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743778090_baeb75d9-d130-47dd-95eb-9d6a0993c93c.jpg?v=1715744595&width=1000"],
    categoryId: "Hoodies",
    isNewIn: true,
    isTopSelling: false,
  ),
  Product(
    id: generateSlug("Air Max Sneakers"),
    name: "Air Max Sneakers",
    currentPrice: 55.00,
    originalPrice: 100.00,
    images: ["https://en.afew-store.com/cdn/shop/collections/nike-air-max.jpg?v=1675692992&width=1200"],
    categoryId: "Shoes",
    isNewIn: false,
    isTopSelling: true,
  ),
  Product(
    id: generateSlug("Red Bag"),
    name: "Red Bag",
    currentPrice: 100.00,
    originalPrice: 150.00,
    images: ["https://www.hypeelixir.com/cdn/shop/files/cv934_imup7_a0.webp?v=1731422228"],
    categoryId: "Bags",
    isNewIn: false,
    isTopSelling: true,
  ),
  Product(
    id: generateSlug("Men's Hoodie"),
    name: "Men's Hoodie",
    currentPrice: 140.00,
    originalPrice: 200.00,
    images:[ "https://m.media-amazon.com/images/I/71oZfgQ4jIL._AC_SL1500_.jpg"],
    categoryId: "Hoodies",
    isNewIn: false,
    isTopSelling: true,
  ),

  
  Product(
    id: generateSlug("Leather Belt"),
    name: "Leather Belt",
    currentPrice: 40.00,
    originalPrice: 60.00,
    images: [
      "https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/25253182/2023/9/29/e4df63df-6626-498b-aab4-b09903aa05831695991036074RoadsterMenVeganLeatherBelt2.jpg",
    ],
    categoryId: "Accessories",
    isNewIn: true,
    isTopSelling: false,
  ),
  Product(
    id: generateSlug("Men's Cargo Shorts"),
    name: "Men's Cargo Shorts",
    currentPrice: 70.00,
    originalPrice: 90.00,
    images: [
      "https://m.media-amazon.com/images/I/61vcHf08TTL._UF350,350_QL80_.jpg",
    ],
    categoryId: "Shorts",
    isNewIn: false,
    isTopSelling: true,
  ),
  Product(
    id: generateSlug("Classic Sunglasses"),
    name: "Classic Sunglasses",
    currentPrice: 85.00,
    originalPrice: 120.00,
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBvKwjDJinGEkee29Vl-FVzwNaz-_pCAWo4vlvaANx4yxPsOdjvsGLM8M7KdI0VOtp-4&usqp=CAU",
    ],
    categoryId: "Accessories",
    isNewIn: true,
    isTopSelling: true,
  ),
  Product(
    id: generateSlug("Backpack"),
    name: "Backpack",
    currentPrice: 115.00,
    originalPrice: 160.00,
    images: [
      "https://solo-ny.com/cdn/shop/files/UBN795-4_HO_887bba68-33a4-48d5-a1b6-b5947c6164ac.jpg?v=1695140976",
    ],
    categoryId: "Bags",
    isNewIn: false,
    isTopSelling: false,
  ),
  Product(
    id: generateSlug("Running Shoes"),
    name: "Running Shoes",
    currentPrice: 130.00,
    originalPrice: 180.00,
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOdbk-OdryulLAbxQT3O0ud56pP3z9XnVriA&s",
    ],
    categoryId: "Shoes",
    isNewIn: true,
    isTopSelling: true,
  ),
];

Future<void> seedProducts() async {
  final service = ProductRepository();
  for (var product in sampleProducts) {
    await service.addProduct(product);
  }
}
