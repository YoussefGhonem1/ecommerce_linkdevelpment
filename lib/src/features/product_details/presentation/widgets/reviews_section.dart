import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/reviews_title.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.reviews,
          style: Theme.of(context).textTheme.headlineSmall
        ),
        const SizedBox(height: 8),
        Text(
          '4.5 ${AppLocalizations.of(context)!.rating}',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontFamily: 'Gabarito',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '213 ${AppLocalizations.of(context)!.reviews}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        const ReviewTile(
          name: 'Alex Morgan',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCvOzfh7BelELSROZatmi3xxMBIlfWTjt0Bw&s',
          rating: 4,
          comment:
              'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
          date: '12days ago',
        ),
        const SizedBox(height: 20),
        const ReviewTile(
          name: 'Alex Morgan',
          imageUrl: 'https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?semt=ais_hybrid&w=740',
          rating: 3,
          comment:
              'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
          date: '12days ago',
        ),
      ],
    );
  }
}
