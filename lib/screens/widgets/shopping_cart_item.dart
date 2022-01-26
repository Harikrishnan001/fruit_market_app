import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/widgets/adder_subtractor.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/order.dart';

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.order.qty;
  }

  void _updateQty(int value) {
    if (value < 1 || value > 500) return;
    setState(() {
      count = value;
    });

    //TODO:update the count
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 160,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.network(
                      widget.order.item.imageURL,
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
                        SizedBox(
                          width: 120,
                          child: Text(
                            widget.order.item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (widget.order.offer != 0)
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'Rs ${widget.order.offer} Saved',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 10.0,
                                color: const Color(0xFF69A03A),
                              ),
                            ),
                          ),
                        const Spacer(),
                      ],
                    ),
                    if (widget.order.offer != 0)
                      Text(
                        'Rs ${widget.order.item.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      'Rs ${widget.order.item.price - widget.order.offer} / Kg',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        AdderSubtractor(
                          onDecrement: () {
                            _updateQty(count - 1);
                          },
                          onIncrement: () {
                            _updateQty(count + 1);
                          },
                          value: count,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        )
      ],
    );
  }
}
