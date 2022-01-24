import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double borderRadius;
  final String text;
  final Color? backgroundColor;
  const CustomButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.borderRadius = 12.0,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.green[800]),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16.0),
        ),
        backgroundColor:
            MaterialStateProperty.all(backgroundColor ?? primaryColor),
      ),
    );
  }
}
