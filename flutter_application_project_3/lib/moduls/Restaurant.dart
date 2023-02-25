class Restaurant {
  final String id;
  final String name;
  final String logo;
  final String image;
  final List menu;

  const Restaurant({
    required this.id,
    required this.name,
    required this.logo,
    required this.image,
    required this.menu,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      logo: map['logo'],
      image: map['image'],
      menu: map['menus'],
    );
  }
}
