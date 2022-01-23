import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 550,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50.0),
                      Text(
                        'Enter Your Name',
                        style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                TextField(
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 18.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  'Add Address',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15.0),
                TextField(
                  style: GoogleFonts.poppins(),
                  maxLines: 6,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 18.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                CustomButton(
                  text: 'VERIFY',
                  onPressed: () {
                    //TODO:implement verification
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
