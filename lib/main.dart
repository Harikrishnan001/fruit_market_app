import 'package:flutter/material.dart';
import 'package:fruit_market_app/data/fruits.dart';
import 'screens/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailsScreen(
        item: organicFruits[0],
      ),
    );
  }
}
