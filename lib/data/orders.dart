import 'dart:math';

import 'package:fruit_market_app/data/fruits.dart';
import 'package:fruit_market_app/models/order.dart';

final orders = <Order>[
  for (final item in organicFruits)
    Order(
      qty: Random().nextInt(5) + 1,
      delivery: DateTime.now(),
      item: item,
      rating: 3,
      offer: 30,
    )
];
