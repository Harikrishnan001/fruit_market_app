import 'package:flutter/material.dart';
//<<<<<<< HEAD
import 'package:fruit_market_app/screens/main_page.dart';
import '/screens/loading_screen.dart';
//=======
import '/screens/my_orders_screen.dart';
//>>>>>>> 1052e37fb32e8d0ddd372b440e892d26dc8ed57f

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
//<<<<<<< HEAD
      home: MainPage(),
//=======
    //  home: MyOrdersScreen(),
//>>>>>>> 1052e37fb32e8d0ddd372b440e892d26dc8ed57f
    );
  }
}
