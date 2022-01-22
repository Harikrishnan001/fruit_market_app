import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final String alpha;
  final VoidCallback? onPressed;
  const NumberButton({
    Key? key,
    required this.number,
    required this.alpha,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Container(
          alignment: Alignment.center,
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xF0EFEFEF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 24.0,
                ),
              ),
              if (alpha.isNotEmpty)
                Text(
                  alpha,
                  style: GoogleFonts.poppins(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
