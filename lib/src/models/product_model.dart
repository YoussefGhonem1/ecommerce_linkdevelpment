class ProductModel {
  final String imageUrl;
  final String productName;
  final double currentPrice;
  final double? originalPrice;

  ProductModel({
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    this.originalPrice,
  });

  static List<ProductModel> products = [
    ProductModel(
      productName: "Men's Harringiton Jacket",
      imageUrl:
          'https://drive.google.com/uc?export=view&id=1WMqdrPBbIqk8aamWW6AGKVQKiwBTAiCg',
      currentPrice: 55.00,
      originalPrice: 100.00,
    ),
    ProductModel(
      productName: "Men's Harringiton Jacket",
      imageUrl:
          'https://drive.google.com/uc?export=view&id=1WMqdrPBbIqk8aamWW6AGKVQKiwBTAiCg',
      currentPrice: 55.00,
      originalPrice: 100.00,
    ),
    ProductModel(
      productName: "Men's Harringiton Jacket",
      imageUrl:
          'https://drive.google.com/uc?export=view&id=1WMqdrPBbIqk8aamWW6AGKVQKiwBTAiCg',
      currentPrice: 55.00,
      originalPrice: 100.00,
    ),
    ProductModel(
      productName: "Men's Harringiton Jacket",
      imageUrl:
          'https://drive.google.com/uc?export=view&id=1WMqdrPBbIqk8aamWW6AGKVQKiwBTAiCg',
      currentPrice: 55.00,
      originalPrice: 100.00,
    ),
  ];
}
