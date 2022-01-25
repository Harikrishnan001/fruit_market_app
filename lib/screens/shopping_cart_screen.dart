import 'package:flutter/material.dart';
import 'package:fruit_market_app/data/orders.dart';
import 'package:fruit_market_app/models/order.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'widgets/shopping_cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  static const String routeName = "ShoppingCart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            //TODO:Go back
          },
        ),
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
        bottom: const CustomAppBarBottom(),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ShoppingCartItem(order: order);
        },
      ),
    );
  }
}

class CustomAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.grey,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  ' 440001  Nagpur ,Maharashtra',
                  style: GoogleFonts.poppins(),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
                size: 30.0,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  //TODO:change address
                },
                child: Text(
                  'Change Address',
                  style: GoogleFonts.poppins(
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}
