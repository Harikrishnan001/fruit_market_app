import 'item.dart';

class Order {
  int rating;
  final DateTime delivery;
  final Item item;
  final int qty;
  final int offer;

  Order({
    required this.item,
    required this.qty,
    required this.delivery,
    this.rating = 0,
    this.offer = 0,
  });

  bool isDelivered() {
    return DateTime.now().isAfter(delivery);
  }
}
