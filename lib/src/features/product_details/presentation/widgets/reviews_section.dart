import 'package:ecommerce_app/src/features/product_details/presentation/widgets/reviews_title.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key,
    required this.product
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${product.reviewCount} Reviews',
          style: Theme.of(context).textTheme.headlineSmall
        ),
        const SizedBox(height: 8),
        Text(
          '${product.ratingcount} Ratings',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontFamily: 'Gabarito',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${product.reviewCount} Reviews',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        ...product.reviews.map((p) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ReviewTile(
            name: p.name,
            imageUrl: p.image,
            rating: p.numOfStars,
            comment: p.review,
            date: p.time,
          ),
        )),
      ],
    );
  }
}
