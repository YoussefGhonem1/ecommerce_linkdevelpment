import 'package:ecommerce_app/src/features/product_seeding/data/reviews_model.dart';
import 'product_model.dart';
import 'product_repository.dart';
import 'package:ecommerce_app/src/features/product_seeding/utils/generate_slug.dart';

final sampleProducts = [
  Product(
    id: generateSlug("Men's Harringiton Jacket"),
    name: "Men's Harringiton Jacket",
    currentPrice: 148.00,
    originalPrice: 200.00,
    images: [
      "https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743778090_baeb75d9-d130-47dd-95eb-9d6a0993c93c.jpg?v=1715744595&width=1000",
      'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743647018.jpg?v=1715744424&width=1080',
      'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743974698.jpg?v=1715744430&width=1080',
      'https://andsons.co.uk/cdn/shop/files/RebelJacketStoneLSMOBILE6.jpg',
      'https://i.ebayimg.com/images/g/bnsAAOSw89xfQpbN/s-l400.jpg',
      'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743647018.jpg?v=1715744424&width=1080',
      'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743974698.jpg?v=1715744430&width=1080',
      'https://andsons.co.uk/cdn/shop/files/RebelJacketStoneLSMOBILE6.jpg',
    ],
    description:
        "Stylish Harrington jacket perfect for casual and semi-formal looks.",
    categoryId: "Hoodies",
    isNewIn: true,
    isTopSelling: false,
    ratingcount: "4.5",
    reviewCount: "12",
    reviews: [
      Review(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCvOzfh7BelELSROZatmi3xxMBIlfWTjt0Bw&s',
        name: "Omar Khaled",
        numOfStars: 5,
        review: "Very comfortable and stylish, perfect fit! Highly recommend.",
        time: "1 day ago",
      ),
      Review(
        image:
            'https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?semt=ais_hybrid&w=740',
        name: "Sara Ahmed",
        numOfStars: 4,
        review:
            "Good quality but the sleeves are a bit long. Overall, happy with the purchase.",
        time: "2 days ago",
      ),
    ],
  ),
  Product(
    id: generateSlug("Air Max Sneakers"),
    name: "Air Max Sneakers",
    currentPrice: 55.00,
    originalPrice: 100.00,
    images: [
      "https://en.afew-store.com/cdn/shop/collections/nike-air-max.jpg?v=1675692992&width=1200",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa40g5TP76ys9bUlutxuvCx5q1F0wYLLS86JtyMhlOnHowIIXOogrDotTDl_mnOx92fII&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-q8_qH77HQg37CVKkefk0AX5XZN8OQRRGexXWqMOWnJDM8oqcfbC0lmE8_1TYas_yo0&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8W_NXjQ1pexBnMNQyCmE0RI1ZLfQ3NDD3ps4IeaLf8xL9zXXcQaH91wTW5rohrsh9M7o&usqp=CAU",
    ],
    description:
        "Lightweight sneakers designed for maximum comfort and performance. Perfect for running or casual wear.",
    categoryId: "Shoes",
    isNewIn: false,
    isTopSelling: true,
    ratingcount: "4.8",
    reviewCount: "30",
    reviews: [
      Review(
        image:
            "data:image/jpeg;base64,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",
        name: "Ali Hassan",
        numOfStars: 5,
        review:
            "Best sneakers I've bought in years!  Super comfortable and stylish.",
        time: "3 days ago",
      ),
      Review(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuexvO9lakED0J-8tqN6yp0LkcAMTR5a8ZDQ&s",
        name: "Fatima Ali",
        numOfStars: 5,
        review:
            "Best sneakers I've bought in years!  Super comfortable and stylish.",
        time: "3 days ago",
      ),
    ],
  ),
  Product(
    id: generateSlug("Red Bag"),
    name: "Red Bag",
    currentPrice: 100.00,
    originalPrice: 150.00,
    images: [
      "https://www.hypeelixir.com/cdn/shop/files/cv934_imup7_a0.webp?v=1731422228",
      "https://www.hypeelixir.com/cdn/shop/files/cv934_imup7_a0.webp?v=1731422228",
      "https://www.hypeelixir.com/cdn/shop/files/cv934_imup7_a0.webp?v=1731422228",
      "https://www.hypeelixir.com/cdn/shop/files/cv934_imup7_a0.webp?v=1731422228",
    ],
    description:
        "Elegant red handbag suitable for both casual and formal occasions. Spacious and stylish.",
    categoryId: "Bags",
    isNewIn: false,
    isTopSelling: true,
    ratingcount: "4.2",
    reviewCount: "8",
    reviews: [
      Review(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgM69T4Q5OebwtYtxP5Mrn9krvGAE2KbKw1Q&s",
        name: "Nour Mohamed",
        numOfStars: 5,
        review:
            "Absolutely love this bag! The color is vibrant and it has plenty of space for all my essentials.",
        time: "10 hours ago",
      ),
    ],
  ),
  Product(
    id: generateSlug("Men's Hoodie"),
    name: "Men's Hoodie",
    currentPrice: 140.00,
    originalPrice: 200.00,
    images: [
      "https://m.media-amazon.com/images/I/71oZfgQ4jIL._AC_SL1500_.jpg",
      "https://m.media-amazon.com/images/I/71oZfgQ4jIL._AC_SL1500_.jpg",
      "https://m.media-amazon.com/images/I/71oZfgQ4jIL._AC_SL1500_.jpg",
      "https://m.media-amazon.com/images/I/71oZfgQ4jIL._AC_SL1500_.jpg",
    ],
    description: "Warm and cozy hoodie made from premium cotton.",
    categoryId: "Hoodies",
    isNewIn: false,
    isTopSelling: true,
    ratingcount: "4.7",
    reviewCount: "15",
    reviews: [
      Review(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCvOzfh7BelELSROZatmi3xxMBIlfWTjt0Bw&s',
        name: "Omar Khaled",
        numOfStars: 3,
        review:
            "The hoodie is comfortable but the color faded after the first wash. Disappointed.",
        time: "1 day ago",
      ),
    ],
  ),
  Product(
    id: generateSlug("Leather Belt"),
    name: "Leather Belt",
    currentPrice: 40.00,
    originalPrice: 60.00,
    images: [
      "https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/25253182/2023/9/29/e4df63df-6626-498b-aab4-b09903aa05831695991036074RoadsterMenVeganLeatherBelt2.jpg",
      "https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/25253182/2023/9/29/e4df63df-6626-498b-aab4-b09903aa05831695991036074RoadsterMenVeganLeatherBelt2.jpg",
      "https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/25253182/2023/9/29/e4df63df-6626-498b-aab4-b09903aa05831695991036074RoadsterMenVeganLeatherBelt2.jpg",
      "https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/25253182/2023/9/29/e4df63df-6626-498b-aab4-b09903aa05831695991036074RoadsterMenVeganLeatherBelt2.jpg",
    ],
    description: "Durable vegan leather belt with a classic buckle design.",
    categoryId: "Accessories",
    isNewIn: true,
    isTopSelling: false,
    ratingcount: "4.0",
    reviewCount: "5",
    reviews: [
      Review(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCvOzfh7BelELSROZatmi3xxMBIlfWTjt0Bw&s',
        name: "Omar Khaled",
        numOfStars: 1,
        review: "The belt broke after a week of use. Not worth the price.",
        time: "1 day ago",
      ),
    ],
  ),
  Product(
    id: generateSlug("Men's Cargo Shorts"),
    name: "Men's Cargo Shorts",
    currentPrice: 70.00,
    originalPrice: 90.00,
    images: [
      "https://m.media-amazon.com/images/I/61vcHf08TTL._UF350,350_QL80_.jpg",
      "https://m.media-amazon.com/images/I/61vcHf08TTL._UF350,350_QL80_.jpg",
      "https://m.media-amazon.com/images/I/61vcHf08TTL._UF350,350_QL80_.jpg",
      "https://m.media-amazon.com/images/I/61vcHf08TTL._UF350,350_QL80_.jpg",
      "https://m.media-amazon.com/images/I/61vcHf08TTL._UF350,350_QL80_.jpg",
    ],
    description:
        "Lightweight and comfortable cargo shorts with multiple pockets.",
    categoryId: "Shorts",
    isNewIn: false,
    isTopSelling: true,
    ratingcount: "4.3",
    reviewCount: "9",
    reviews: [
      Review(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCvOzfh7BelELSROZatmi3xxMBIlfWTjt0Bw&s',
        name: "Omar Khaled",
        numOfStars: 5,
        review: "Very comfortable and stylish, perfect fit! Highly recommend.",
        time: "1 day ago",
      ),
    ],
  ),
  Product(
    id: generateSlug("Classic Sunglasses"),
    name: "Classic Sunglasses",
    currentPrice: 85.00,
    originalPrice: 120.00,
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBvKwjDJinGEkee29Vl-FVzwNaz-_pCAWo4vlvaANx4yxPsOdjvsGLM8M7KdI0VOtp-4&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBvKwjDJinGEkee29Vl-FVzwNaz-_pCAWo4vlvaANx4yxPsOdjvsGLM8M7KdI0VOtp-4&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBvKwjDJinGEkee29Vl-FVzwNaz-_pCAWo4vlvaANx4yxPsOdjvsGLM8M7KdI0VOtp-4&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBvKwjDJinGEkee29Vl-FVzwNaz-_pCAWo4vlvaANx4yxPsOdjvsGLM8M7KdI0VOtp-4&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBvKwjDJinGEkee29Vl-FVzwNaz-_pCAWo4vlvaANx4yxPsOdjvsGLM8M7KdI0VOtp-4&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBvKwjDJinGEkee29Vl-FVzwNaz-_pCAWo4vlvaANx4yxPsOdjvsGLM8M7KdI0VOtp-4&usqp=CAU",
    ],
    description: "Timeless sunglasses with UV protection lenses.",
    categoryId: "Accessories",
    isNewIn: true,
    isTopSelling: true,
    ratingcount: "4.6",
    reviewCount: "20",
    reviews: [
      Review(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCvOzfh7BelELSROZatmi3xxMBIlfWTjt0Bw&s',
        name: "Omar Khaled",
        numOfStars: 4,
        review:
            "Great sunglasses, but the frame feels a bit flimsy. Still stylish though.",
        time: "2 day ago",
      ),
    ],
  ),
  Product(
    id: generateSlug("Backpack"),
    name: "Backpack",
    currentPrice: 115.00,
    originalPrice: 160.00,
    images: [
      "https://solo-ny.com/cdn/shop/files/UBN795-4_HO_887bba68-33a4-48d5-a1b6-b5947c6164ac.jpg?v=1695140976",
      "https://solo-ny.com/cdn/shop/files/UBN795-4_HO_887bba68-33a4-48d5-a1b6-b5947c6164ac.jpg?v=1695140976",
      "https://solo-ny.com/cdn/shop/files/UBN795-4_HO_887bba68-33a4-48d5-a1b6-b5947c6164ac.jpg?v=1695140976",
      "https://solo-ny.com/cdn/shop/files/UBN795-4_HO_887bba68-33a4-48d5-a1b6-b5947c6164ac.jpg?v=1695140976",
      "https://solo-ny.com/cdn/shop/files/UBN795-4_HO_887bba68-33a4-48d5-a1b6-b5947c6164ac.jpg?v=1695140976",
      "https://solo-ny.com/cdn/shop/files/UBN795-4_HO_887bba68-33a4-48d5-a1b6-b5947c6164ac.jpg?v=1695140976",
    ],
    description: "Spacious and durable backpack for travel and daily use.",
    categoryId: "Bags",
    isNewIn: false,
    isTopSelling: false,
    ratingcount: "4.1",
    reviewCount: "7",
    reviews: [],
  ),
  Product(
    id: generateSlug("Running Shoes"),
    name: "Running Shoes",
    currentPrice: 130.00,
    originalPrice: 180.00,
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOdbk-OdryulLAbxQT3O0ud56pP3z9XnVriA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOdbk-OdryulLAbxQT3O0ud56pP3z9XnVriA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOdbk-OdryulLAbxQT3O0ud56pP3z9XnVriA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOdbk-OdryulLAbxQT3O0ud56pP3z9XnVriA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOdbk-OdryulLAbxQT3O0ud56pP3z9XnVriA&s",
    ],
    description: "High-performance running shoes designed for long distances.",
    categoryId: "Shoes",
    isNewIn: true,
    isTopSelling: true,
    ratingcount: "4.9",
    reviewCount: "42",
    reviews: [],
  ),
];

Future<void> seedProducts() async {
  final service = ProductRepository();
  for (var product in sampleProducts) {
    await service.addProduct(product);
  }
}
