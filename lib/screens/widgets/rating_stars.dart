import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int max;
  final int initialRating;
  final double starSize;
  final void Function(int) onTap;

  const RatingStars({
    Key? key,
    this.max = 5,
    this.starSize = 30.0,
    required this.initialRating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () => onTap(i),
            child: Icon(
              Icons.star,
              size: starSize,
              color: initialRating >= i
                  ? const Color(0xFFFFB238)
                  : const Color(0xFFA6A1A1),
            ),
          ),
      ],
    );
  }
}
