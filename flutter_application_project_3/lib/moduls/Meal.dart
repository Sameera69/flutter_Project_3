class Meal {
  final String id;
  final String name;
  final double price;
  final String pic;

  const Meal({
    required this.id,
    required this.name,
    required this.price,
    required this.pic,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      name: map['name'],
      price: double.parse(map['price'].toString()),
      pic: map['pic'],
    );
  }
}
