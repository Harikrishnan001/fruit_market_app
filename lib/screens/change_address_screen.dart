import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class ChangeAddressScreen extends StatelessWidget {
  const ChangeAddressScreen({Key? key}) : super(key: key);

  static const String routeName = "ChangeAddress";

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
          'Change Address',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Address',
                    style: GoogleFonts.poppins(fontSize: 18.0),
                  ),
                ),
                TextField(
                  maxLines: 5,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                CustomButton(
                  text: 'CHANGE',
                  onPressed: () {
                    //TODO:change address
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
