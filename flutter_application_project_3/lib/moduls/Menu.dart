class Menu {
  final String id;
  final String name;
  final List<String>? meals;

  const Menu({
    required this.id,
    required this.name,
    required this.meals,
  });

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'],
      name: map['name'],
      meals: map['meals'],
    );
  }
}
