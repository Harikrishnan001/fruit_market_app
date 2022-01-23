class Item {
  final String name;
  final int rating;
  final int price;
  final bool fav;
  final String description;
  final List<String> nutrition;

  Item({
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
    required this.nutrition,
    this.fav = false,
  });
}
