import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/CartPage.dart';
import 'package:flutter_application_project_3/components/mealCard.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/Meal.dart';
import 'package:flutter_application_project_3/moduls/Restaurant.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({
    super.key,
    required this.navBarIndex,
    required this.restaurantId,
  });
  final int navBarIndex;
  final String restaurantId;

  @override
  State<RestaurantPage> createState() => _RestaurantPage();
}

class _RestaurantPage extends State<RestaurantPage> {
  List<Restaurant> restaurants = [];
  List<Meal> meals = [];
  Restaurant restaurant = const Restaurant(id: '0', name: 'name', logo: 'logo', image: 'image', menu: []);
  String test = '';
  final _controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    listenToRestaurants();
    listenToMeals();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  listenToRestaurants() {
    FirebaseFirestore.instance.collection('restaurant').snapshots().listen((event) {
      List<Restaurant> newList = [];
      for (final doc in event.docs) {
        final restaurant = Restaurant.fromMap(doc.data());
        newList.add(restaurant);
      }
      restaurants = newList;
      setState(() {});
    });
  }

  listenToMeals() {
    FirebaseFirestore.instance.collection('menu').snapshots().listen((event) {
      List<Meal> neaList = [];
      for (final doc in event.docs) {
        final meal = Meal.fromMap(doc.data());
        neaList.add(meal);
      }
      meals = neaList;
      setState(() {});
    });
  }

  Future<List<Meal>> getMenus() async {
    final collectionm = await FirebaseFirestore.instance.collection('menu').get();
    List<Meal> newListm = [];
    test = 'inside';
    for (final doc in collectionm.docs) {
      final meal = Meal.fromMap(doc.data());
      newListm.add(meal);
    }
    test = 'finish';
    print(newListm.length);
    return newListm;
  }

  Future<List<Restaurant>> getRestaurants() async {
    final collection = await FirebaseFirestore.instance.collection('restaurant').get();
    List<Restaurant> newList = [];
    for (final doc in collection.docs) {
      final restaurant = Restaurant.fromMap(doc.data());
      newList.add(restaurant);
    }
    print(newList);
    return newList;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget notifi;
    if (Cart.item != 0) {
      notifi = Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(' ' + Cart.item.toString()),
      );
    } else {
      notifi = const SizedBox();
    }

    int indexMenu = 0;
    for (var res in restaurants) {
      if (res.id == widget.restaurantId) {
        restaurant = res;
      }
    }
    int curr = 0;
    List<Widget> list = <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (Meal meal in meals)
            if (isMeal(meal.id.substring(0, 2), restaurant.id, 0.toString()))
              mealCard(
                meal: meal,
                resturantName: restaurant.name,
                restaurantLogo: restaurant.logo,
                onDelete: () {
                  setState(() {});
                },
              ),
        ],
      ),
      Column(
        children: [
          for (Meal meal in meals)
            if (isMeal(meal.id.substring(0, 2), restaurant.id, 1.toString()))
              mealCard(
                meal: meal,
                resturantName: restaurant.name,
                restaurantLogo: restaurant.logo,
                onDelete: () {
                  setState(() {});
                },
              ),
        ],
      ),
      Column(
        children: [
          for (Meal meal in meals)
            if (isMeal(meal.id.substring(0, 2), restaurant.id, 2.toString()))
              mealCard(
                meal: meal,
                resturantName: restaurant.name,
                restaurantLogo: restaurant.logo,
                onDelete: () {
                  setState(() {});
                },
              ),
        ],
      ),
      Column(
        children: [
          for (Meal meal in meals)
            if (isMeal(meal.id.substring(0, 2), restaurant.id, 2.toString()))
              mealCard(
                meal: meal,
                resturantName: restaurant.name,
                restaurantLogo: restaurant.logo,
                onDelete: () {
                  setState(() {});
                },
              ),
        ],
      ),
    ];

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Image.network(
                  restaurant.image,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(100, 100, 100, 0.5),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: const BorderRadius.all(Radius.circular(40))),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(100, 100, 100, 0.5),
                        border: Border.all(color: Colors.transparent),
                        borderRadius: const BorderRadius.all(Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(100, 100, 100, 0.5),
                        border: Border.all(color: Colors.transparent),
                        borderRadius: const BorderRadius.all(Radius.circular(0))),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              restaurant.logo,
                              width: 79,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 30, 56, 78),
                                    border: Border.all(color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                                child: Row(
                                  children: const [
                                    Text('Plus Active', style: TextStyle(color: Colors.white, fontSize: 12)),
                                    Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      Text('4.3'),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: Colors.grey,
                                      ),
                                      Text('32-38 min'),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.discount,
                                    color: Colors.blue,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    for (var menu in restaurant.menu)
                      InkWell(
                        onTap: () {
                          indexMenu = restaurant.menu.indexOf(menu);
                          setState(() {});
                        },
                        child: Text(
                          '${'  ' + menu}  ',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 600,
              width: 400,
              child: PageView(
                controller: _controller,
                onPageChanged: (num) {
                  setState(() {
                    curr = num;
                  });
                },
                children: list,
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
            backgroundColor: Colors.white,
            child: Stack(
              children: [
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: notifi,
                ),
              ],
            )));
  }

  bool isMeal(String mSub, String resId, String mIndex) {
    return mSub == resId + mIndex;
  }
}
