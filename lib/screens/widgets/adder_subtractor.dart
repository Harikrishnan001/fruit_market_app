import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdderSubtractor extends StatelessWidget {
  const AdderSubtractor({
    Key? key,
    required this.onDecrement,
    required this.onIncrement,
    required this.value,
  }) : super(key: key);

  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onIncrement,
          child: Container(
              height: 30.0,
              width: 30.0,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              child: const Icon(Icons.minimize)),
        ),
        SizedBox(
          height: 30.0,
          width: 30.0,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18.0,
            ),
          ),
        ),
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            height: 30.0,
            width: 30.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(width: 1.0, color: Colors.black),
            ),
            child: const Icon(
              Icons.add,
              size: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
