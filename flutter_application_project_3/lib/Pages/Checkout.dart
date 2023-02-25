import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/LocationPage.dart';
import 'package:flutter_application_project_3/Pages/NavBar.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/OrderC.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _Checkout();
}

class _Checkout extends State<Checkout> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              children: const [
                Text('Checkout'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Items',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Order total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Cart.item} available',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'SAR ${Cart.total}.00',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: AppStyle.spasingHight),
            InkWell(
              onTap: () {
                OrderC.thereIsOrder = true;
                List Omeals = [];
                for (var meal in Cart.meals) {
                  Omeals.add(meal.id);
                }
                OrderC order = OrderC(
                    id: '${Cart.user.orders.length + 1}${Cart.user.email}',
                    date: DateTime.now().toString(),
                    state: 'Delivery',
                    meals: Omeals);
                Cart.user.orders.add('${Cart.user.orders.length + 1}${Cart.user.email}');
                final orderCollection = FirebaseFirestore.instance.collection('order');
                final orderDoc = orderCollection.doc(order.id);
                orderDoc.set(order.toMap());
                final userCollection = FirebaseFirestore.instance.collection('user');
                final userDoc = userCollection.doc(Cart.user.email);
                userDoc.set(Cart.user.toMap());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavBar(
                              currentIndex: 1,
                              secondePage: 1,
                              restaurantId: '',
                            )));
                setState(() {});
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  border: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                width: AppStyle.bottonWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child:
                        Text('Place order', style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: const Color.fromARGB(255, 216, 216, 216)),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Cart.restaurantName, style: const TextStyle(fontSize: 16)),
                      Image.network(
                        Cart.restaurantLogo,
                        width: 60,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppStyle.spasingHight,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: const Color.fromARGB(255, 216, 216, 216)),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Payment method', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.monetization_on_rounded,
                              color: Colors.blue,
                            ),
                            Text('Cash')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppStyle.spasingHight,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: const Color.fromARGB(255, 216, 216, 216)),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      const Text(
                        'Delivery Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('selected location'),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 200, child: MapFrame(latitude: Cart.Lat, longitude: Cart.lng)),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppStyle.spasingHight,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: const Color.fromARGB(255, 216, 216, 216)),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      Text(
                        'Available items (${Cart.item})',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (final meal in Cart.meals)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      meal.name,
                                    ),
                                    Text('SAR ${meal.price}.00'),
                                  ],
                                ),
                                Image.network(
                                  meal.pic,
                                  width: 50,
                                ),
                              ],
                            ),
                            const Divider(),
                          ],
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
