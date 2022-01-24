import 'package:flutter/material.dart';
import 'package:fruit_market_app/data/orders.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'widgets/order_summary.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'My Orders',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1.0,
          thickness: 1,
        ),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final orderItem = orders[index];
          return OrderSummary(orderItem: orderItem);
        },
      ),
    );
  }
}
