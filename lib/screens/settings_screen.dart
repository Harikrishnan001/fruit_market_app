import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/widgets/custom_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String routeName = "Settings";
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
          'Settings',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomListTile(
            title: 'Account',
            iconData: Icons.account_circle,
            onTap: () {},
          ),
          CustomListTile(
            title: 'Notification',
            iconData: Icons.notifications,
            onTap: () {},
          ),
          CustomListTile(
            title: 'Language',
            iconData: Icons.language,
            onTap: () {},
          ),
          CustomListTile(
            title: 'Account',
            iconData: Icons.edit_location,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
