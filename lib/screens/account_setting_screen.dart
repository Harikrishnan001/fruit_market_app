import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/widgets/custom_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  static const String routeName = "AccountSettings";

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
          'Account Settings',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomListTile(
            title: 'Security',
            iconData: Icons.shield,
            onTap: () {},
          ),
          CustomListTile(
            title: 'Deactivate Account',
            iconData: Icons.cancel,
            onTap: () {},
          ),
          CustomListTile(
            title: 'Delete Account',
            iconData: Icons.delete,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
