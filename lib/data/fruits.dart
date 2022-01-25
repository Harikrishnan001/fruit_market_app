import 'package:fruit_market_app/models/item.dart';

final organicFruits = <Item>[
  const Item(
    category: 0,
    name: 'Strawberry',
    rating: 4,
    price: 580,
    imageURL:
        "https://vegan.rocks/blog/strawberries/feature_hu5daf639476375d69a5a925617fd26131_1242983_1600x1200_fill_q75_box_smart1.jpg",
    description:
        "The garden strawberry is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.",
    nutrition: [
      'Vitamin B',
      'Vitamin B6',
      'Vitamin D',
      'Magnesium',
      'Iron',
      'Calcium'
    ],
  ),
  const Item(
    category: 0,
    name: 'Grapes',
    rating: 5,
    price: 125,
    imageURL:
        "https://cdn.pixabay.com/photo/2020/10/24/15/40/grapes-5681892_1280.jpg",
    description:
        "Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect yourbody from Cancer.",
    nutrition: [
      'Fiber',
      'Potassium',
      'Iron',
      'Magnesium',
      'Vitamin C',
      'Vitamin K',
      'Zinc',
      'Phosphorous'
    ],
  ),
  const Item(
    category: 0,
    name: 'Oranges',
    rating: 3,
    price: 230,
    imageURL:
        "https://www.publicdomainpictures.net/pictures/10000/nahled/orange-fruit-pattern-11279546974t3lw.jpg",
    description:
        "An orange is a fruit of various citrus species in the family Rutaceae; it primarily refers to Citrus sinensis, which is also called sweet orange, to distinguish it from the related Citrus aurantium, referred to as bitter orange.",
    nutrition: ['Vitamin C', 'Calcium', 'Vitamin B6', 'Magnesium'],
  ),
];
