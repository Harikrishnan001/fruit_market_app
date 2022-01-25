class Item {
  final String name;
  final int rating;
  final int price;
  final bool fav;
  final String description;
  final List<String> nutrition;
  final String imageURL;
  final int category;

  const Item({
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
    required this.nutrition,
    required this.imageURL,
    required this.category,
    this.fav = false,
  });

  static const itemCategory = <int, String>{
    0: "Fruits",
    1: "Dry Fruits",
    2: "Vegetables",
  };
}
