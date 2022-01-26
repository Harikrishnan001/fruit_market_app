import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/widgets/custom_button.dart';
import '/models/item.dart';
import 'package:google_fonts/google_fonts.dart';
import '/data/orders.dart';
import '/models/order.dart';
import '../constants.dart';
import 'widgets/shopping_cart_item.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  static const String routeName = "ShoppingCart";

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final _list = <Order>[];
  @override
  void initState() {
    super.initState();
    _categorise();
  }

  void _categorise() {
    _list.addAll(orders);
    _list.sort((a, b) {
      return a.item.category < b.item.category ? 0 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
          'Shopping Cart',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
        bottom: const CustomAppBarBottom(),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final order = _list[index];
          final widgets = <Widget>[];
          if (index == 0 ||
              (order.item.category - 1 == _list[index - 1].item.category)) {
            widgets.add(Container(
              color: const Color(0xFFE6E6E6),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                Item.itemCategory[order.item.category] ?? "",
                style: GoogleFonts.poppins(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                ),
              ),
            ));
          }
          widgets.add(ShoppingCartItem(order: order));
          if (index == _list.length - 1) {
            widgets.add(Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                  child: TextButton(
                    onPressed: () {
                      //TODO:place order
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0)),
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    child: Text(
                      'Place Order',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              ],
            ));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widgets,
          );
        },
      ),
    );
  }
}

class CustomAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.grey,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  ' 440001  Nagpur ,Maharashtra',
                  style: GoogleFonts.poppins(),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
                size: 30.0,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  //TODO:change address
                },
                child: Text(
                  'Change Address',
                  style: GoogleFonts.poppins(
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}
