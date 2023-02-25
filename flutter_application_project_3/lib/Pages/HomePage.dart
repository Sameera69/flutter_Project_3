import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/CartPage.dart';
import 'package:flutter_application_project_3/Pages/LocationPage.dart';
import 'package:flutter_application_project_3/components/home/newSection.dart';
import 'package:flutter_application_project_3/components/home/promotionsSection.dart';
import 'package:flutter_application_project_3/components/home/sectionFour.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.navBarIndex});
  final int navBarIndex;
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _controller = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        _controller.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    return Scaffold(
        appBar: AppBar(
            title: const Text('What are you looking to buy?'),
            actions: const [Padding(padding: EdgeInsets.all(16.0), child: Icon(Icons.search, color: Colors.white))]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(AppStyle.leftRightPadding, 0, AppStyle.leftRightPadding, 0),
            child: Column(
              children: [
                SizedBox(height: AppStyle.spasingHight),
                const NewSection(),
                SizedBox(height: AppStyle.spasingHight),
                Row(children: [
                  Text('ALWAYS AT YOUR SERVICE',
                      style: TextStyle(
                          color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold)),
                ]),
                Row(
                  children: [
                    Column(children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationPage()));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/p5.png', width: 400))),
                      Row(
                        children: [
                          Text('All Restaurants & Stores',
                              style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ]),
                  ],
                ),
                SizedBox(height: AppStyle.spasingHight),
                Row(
                  children: [
                    Text(
                      'PROMOTIONS',
                      style:
                          TextStyle(color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    PromotionsSection(),
                  ],
                ),
                SizedBox(height: AppStyle.spasingHight),
                const SectionFour(),
                SizedBox(height: AppStyle.spasingHight),
                Row(
                  children: [
                    Column(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/p12.png', width: 400)),
                      Row(
                        children: [
                          Text('Food & Drinks',
                              style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ]),
                  ],
                ),
                SizedBox(height: AppStyle.spasingHight),
                Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/p13.png',
                            width: 160,
                          ),
                        ),
                        Text(
                          'Desserts & Coffee',
                          style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/p14.png',
                            width: 160,
                          ),
                        ),
                        Text(
                          'Juices',
                          style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppStyle.spasingHight),
                Row(
                  children: [
                    Column(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/p15.png', width: 400)),
                      Row(
                        children: [
                          Text('Grocery & Convenience',
                              style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ]),
                  ],
                ),
                SizedBox(height: AppStyle.spasingHight),
                Row(
                  children: [
                    Text(
                      'STORES',
                      style:
                          TextStyle(color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/p16.png',
                            width: 160,
                          ),
                        ),
                        Text(
                          'Well-being',
                          style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/p17.png',
                            width: 160,
                          ),
                        ),
                        Text(
                          'Gifts',
                          style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/p18.png',
                            width: 160,
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: Text(
                            'Home, Fashion, & Accessories',
                            style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/p19.png',
                            width: 160,
                          ),
                        ),
                        Text(
                          'Lifestyle',
                          style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppStyle.spasingHight),
                Row(
                  children: [
                    Text(
                      'COURIER',
                      style:
                          TextStyle(color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/p20.png', width: 400)),
                      Row(
                        children: [
                          Text('Courier',
                              style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ]),
                  ],
                ),
              ],
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
