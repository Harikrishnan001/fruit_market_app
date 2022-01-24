import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);
  static const String routeName = "LanguageSettings";
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
          'Language Settings',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Text(
              'Language',
              style: GoogleFonts.poppins(
                color: const Color(0xFFA6A1A1),
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Language',
              style: GoogleFonts.poppins(
                fontSize: 16.0,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Engilsh',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: '(United\n States)',
                        style:
                            GoogleFonts.poppins(color: const Color(0xFFA6A1A1)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20.0),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
