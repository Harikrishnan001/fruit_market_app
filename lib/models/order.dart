import 'item.dart';

class Order {
  int rating;
  final DateTime delivery;
  final Item item;
  final int qty;

  Order({
    required this.item,
    required this.qty,
    required this.delivery,
    this.rating = 0,
  });

  bool isDelivered() {
    return DateTime.now().isAfter(delivery);
  }
}
