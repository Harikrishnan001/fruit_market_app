import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/order.dart';
import 'rating_stars.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final Order orderItem;

  static const List<String> _month = [
    "Nil",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
                  widget.orderItem.item.imageURL,
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
                      widget.orderItem.item.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                RatingStars(
                  initialRating: widget.orderItem.rating,
                  onTap: (rating) {
                    setState(() {
                      widget.orderItem.rating = rating;
                    });
                  },
                ),
                const SizedBox(height: 6.0),
                Text(
                  'Rate this product',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFA6A1A1),
                    fontSize: 10.0,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  '${widget.orderItem.isDelivered() ? "Delivered" : "Expected delivery"} on ${widget.orderItem.delivery.day} ${OrderSummary._month[widget.orderItem.delivery.month]} ${widget.orderItem.delivery.year}',
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
