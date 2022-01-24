import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';
import 'widgets/custom_list_tile.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);
  static const String routeName = "MyAccount";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 200,
        centerTitle: true,
        title: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: Image.network(
                    "https://freesvg.org/img/myAvatar.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Christopher Nolan',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'christo1995@gmail.com',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14.0,
              ),
            )
          ],
        ),
        actions: [
          Align(
            alignment: const Alignment(0.0, -0.7),
            child: IconButton(
              onPressed: () {
                //TODO:edit user details
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomListTile(
              title: 'My Orders',
              iconData: Icons.shopping_bag,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Favourites',
              iconData: Icons.favorite,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Settings',
              iconData: Icons.settings,
              onTap: () {},
            ),
            CustomListTile(
              title: 'My Cart',
              iconData: Icons.shopping_cart,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Rate Us',
              iconData: Icons.rate_review,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Refer A Friend',
              iconData: Icons.share,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Help',
              iconData: Icons.help,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Log Out',
              iconData: Icons.logout,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
