class UserC {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String wallet;
  List orders;
  List favorites;

  UserC({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.wallet,
    required this.orders,
    required this.favorites,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'wallet': wallet,
      'orders': orders,
      'favorites': favorites,
    };
  }

  factory UserC.fromMap(Map<String, dynamic> map) {
    return UserC(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      wallet: map['wallet'],
      orders: map['orders'],
      favorites: map['favorites'],
    );
  }
}
