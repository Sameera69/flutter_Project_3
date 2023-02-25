import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/LocationPage.dart';
import 'package:flutter_application_project_3/Pages/NavBar.dart';
import 'package:flutter_application_project_3/Pages/CartPage.dart';
import 'package:flutter_application_project_3/components/restaurantCard.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/Restaurant.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class AllRestaurants extends StatefulWidget {
  const AllRestaurants({super.key, required this.navBarIndex});
  final int navBarIndex;

  @override
  State<AllRestaurants> createState() => _AllRestaurants();
}

class _AllRestaurants extends State<AllRestaurants> {
  // This widget is the root of your application.
  List<Restaurant> restaurants = [];
  int naelistlength = -1;
  String mess = '';

  @override
  void initState() {
    listenToRestaurants();
    super.initState();

    //getRestaurants().then((value) {
    // restaurants = value;
    // setState(() {});
    // });
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

  Future<List<Restaurant>> getRestaurants() async {
    final collection = await FirebaseFirestore.instance.collection('restaurant').get();
    List<Restaurant> newList = [];
    for (final doc in collection.docs) {
      final restaurant = Restaurant.fromMap(doc.data());
      newList.add(restaurant);
    }
    return newList;
  }

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
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Text('All Restaurants & Stores'),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationPage()));
                },
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Deliver to ',
                          style: TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontSize: 16)),
                      TextSpan(text: 'Selected location', style: TextStyle(color: Colors.indigo, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(AppStyle.leftRightPadding, 0, AppStyle.leftRightPadding, 0),
              child: Column(
                children: [
                  for (var res in restaurants)
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavBar(
                                        currentIndex: 0,
                                        secondePage: 2,
                                        restaurantId: res.id,
                                      )));
                        },
                        child: RestaurantCard(
                          restaurant: res,
                        )),
                ],
              ),
            ),
          ),
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
}
