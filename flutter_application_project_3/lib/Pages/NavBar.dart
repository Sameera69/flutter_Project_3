import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/AllRestaurants.dart';
import 'package:flutter_application_project_3/Pages/HomePage.dart';
import 'package:flutter_application_project_3/Pages/RestaurantPage.dart';
import 'package:flutter_application_project_3/Pages/orderPage.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/UserC.dart';

class NavBar extends StatefulWidget {
  NavBar({
    super.key,
    required this.currentIndex,
    required this.secondePage,
    required this.restaurantId,
  });
  var currentIndex;
  var secondePage;
  var restaurantId;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setUser(user);
      setState(() {});
    });
  }

  setUser(User? u) async {
    final userCollection = await FirebaseFirestore.instance.collection('user').get();
    for (final doc in userCollection.docs) {
      if (doc.id == u!.email) {
        Cart.user = UserC.fromMap(doc.data());
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget Body;
    if (widget.currentIndex == 0) {
      if (widget.secondePage == 0) {
        Body = const HomePage(
          navBarIndex: 0,
        );
      } else if (widget.secondePage == 1) {
        Body = const AllRestaurants(
          navBarIndex: 0,
        );
      } else if (widget.secondePage == 2) {
        Body = RestaurantPage(
          navBarIndex: 0,
          restaurantId: widget.restaurantId,
        );
      } else if (widget.secondePage == 3) {
        Body = const Scaffold();
      } else {
        Body = const AllRestaurants(
          navBarIndex: 0,
        );
      }
    } else if (widget.currentIndex == 1) {
      Body = const OrderPage();
    } else if (widget.currentIndex == 2) {
      Body = const Scaffold();
    } else {
      Body = const Scaffold();
    }

    return Scaffold(
      body: Body,
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, color: Colors.black), label: 'Shopping'),
            BottomNavigationBarItem(icon: Icon(Icons.directions_car_rounded, color: Colors.black), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet, color: Colors.black), label: 'Wallet'),
            BottomNavigationBarItem(icon: Icon(Icons.message, color: Colors.black), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz, color: Colors.black), label: 'More')
          ],
          onTap: (newIndex) {
            widget.currentIndex = newIndex;
            widget.secondePage = 0;
            setState(() {});
          },
          currentIndex: widget.currentIndex,
          backgroundColor: Colors.indigo,
          selectedItemColor: Colors.indigo),
    );
  }
}
