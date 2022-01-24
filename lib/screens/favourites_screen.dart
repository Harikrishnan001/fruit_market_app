import 'package:flutter/material.dart';
import 'package:fruit_market_app/data/fruits.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'widgets/favourite_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  static const String routeName = "Favourites";
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
          'Favourites',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1.0,
          thickness: 1,
        ),
        itemCount: organicFruits.length,
        itemBuilder: (context, index) {
          final item = organicFruits[index];
          return FavouriteItem(
            item: item,
            onAdd: (count) {
              //TODO:order count of items
            },
          );
        },
      ),
    );
  }
}
