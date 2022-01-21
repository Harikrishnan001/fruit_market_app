import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 80,
                  right: 80,
                  top: 50,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/fruit-market.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                'Fruit Market',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter Your Mobile Number',
                hintStyle: GoogleFonts.poppins(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Text(
            'OR',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginButton(
                imageURL: 'assets/google-logo.png',
                onPressed: () {},
              ),
              LoginButton(
                imageURL: 'assets/facebook-logo.png',
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String imageURL;
  final VoidCallback onPressed;
  const LoginButton({
    Key? key,
    required this.imageURL,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Image.asset(
        imageURL,
      ),
      label: Text(
        'Login with',
        style: GoogleFonts.poppins(
          color: Colors.black,
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
