import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  final ValueChanged onRatingUpdate;
  const RatingBarWidget({Key? key, required this.onRatingUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      glow: false,
      onRatingUpdate: (rating) {
        onRatingUpdate(rating);
      },
    );
  }
}
