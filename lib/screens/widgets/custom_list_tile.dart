import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const CustomListTile({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(
            iconData,
            color: primaryColor,
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16.0,
            ),
          ),
        ),
        const Divider(
          color: Color(0xFFD1D1D1),
          height: 1.0,
        ),
      ],
    );
  }
}
