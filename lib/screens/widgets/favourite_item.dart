import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/item.dart';
import 'adder_subtractor.dart';
import 'rating_stars.dart';

class FavouriteItem extends StatefulWidget {
  final Item item;
  final void Function(int count) onAdd;

  const FavouriteItem({
    Key? key,
    required this.item,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  int count = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateCount(int val) {
    if (val < 1 || val > 500) return;
    setState(() {
      count = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                height: 120.0,
                width: 120.0,
                child: Image.network(
                  widget.item.imageURL,
                  errorBuilder: (context, error, stackTrace) =>
                      const Placeholder(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          SizedBox(
            width: MediaQuery.of(context).size.width - 160.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        '${widget.item.price}/ kg',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Picked up from organic farms',
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      color: const Color(0xFFB2B2B2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RatingStars(
                    initialRating: widget.item.rating,
                    starSize: 16.0,
                    onTap: (rating) {},
                  ),
                ),
                Row(
                  children: [
                    AdderSubtractor(
                      onDecrement: () => _updateCount(count + 1),
                      onIncrement: () => _updateCount(count - 1),
                      value: count,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Add',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 0)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFCC7D00)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
