import '/data/fruits.dart';
import '../models/fruit_notification.dart';

final notifications = <FruitNotification>[
  FruitNotification(
    imageURL: organicFruits[0].imageURL,
    message: "Buy 1 Kg Get 200 gm Free",
    description: "Buy 1 Get 1 Free for small sizesUntil Feb 27,2021 .",
    time: DateTime.now(),
  ),
  FruitNotification(
    imageURL: organicFruits[1].imageURL,
    message: "Get 20 % Discount",
    description: "Get 20% discount offer on buying Peaches today.",
    time: DateTime.now().subtract(const Duration(seconds: 30)),
  ),
  FruitNotification(
    imageURL: organicFruits[2].imageURL,
    message: "Get 20 % Extra",
    description: "Your Order booked ",
    time: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  FruitNotification(
    imageURL: organicFruits[0].imageURL,
    message: "Your Order booked ",
    description:
        "Rajesh will delivered your order.\nThanksfor your order and stay with us.",
    time: DateTime.now().subtract(const Duration(days: 1)),
  ),
  FruitNotification(
    imageURL: organicFruits[1].imageURL,
    message: "Get 20 % Discount",
    description: "Get 20% discount offer on buying Watermelon today.",
    time: DateTime.now().subtract(const Duration(days: 2)),
  ),
];
