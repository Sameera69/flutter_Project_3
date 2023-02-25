import 'package:flutter_application_project_3/moduls/Meal.dart';
import 'package:flutter_application_project_3/moduls/UserC.dart';

class Cart {
  static int item = 0;
  static double total = 0.0;
  static String restaurantName = '';
  static List<Meal> meals = [];
  static String restaurantLogo = '';
  static double Lat = 0.0;
  static double lng = 0.0;
  static UserC user = UserC(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    phone: '',
    wallet: '',
    orders: [],
    favorites: [],
  );
  static String test = '';
}
