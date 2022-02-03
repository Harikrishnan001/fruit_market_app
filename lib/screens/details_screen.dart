import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';
import '/models/item.dart';

class DetailsScreen extends StatelessWidget {
  final Item item;
  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  static const String routeName = "Details";

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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'DETAILS',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: SizedBox(
                  height: 180,
                  child: Image.network(
                    item.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  item.name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  item.description,
                  style: GoogleFonts.poppins(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Nutrition',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                ),
              ),
              for (final s in item.nutrition)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 12.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        s,
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ${item.price} / kg',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    child: CustomButton(
                      text: 'Buy Now',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
