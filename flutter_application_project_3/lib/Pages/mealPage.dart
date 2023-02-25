import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/CartPage.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/Meal.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class MealPage extends StatefulWidget {
  const MealPage({
    super.key,
    required this.navBarIndex,
    required this.meal,
    required this.restaurantName,
    required this.restaurantLogo,
  });
  final int navBarIndex;
  final Meal meal;
  final String restaurantName;
  final String restaurantLogo;
  @override
  State<MealPage> createState() => _MealPage();
}

class _MealPage extends State<MealPage> {
  int MealItemsCounter = 1;
  double totalPrice = 0.0;
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
        child: Text(' ${Cart.item}'),
      );
    } else {
      notifi = const SizedBox();
    }
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Item Price'),
                  if (MealItemsCounter == 1)
                    Text(
                      'SAR ${widget.meal.price}.00',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (MealItemsCounter != 1)
                    Text(
                      'SAR $totalPrice.00',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          border: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('-    $MealItemsCounter    +',
                                style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              MealItemsCounter = MealItemsCounter - 1;
                              totalPrice = totalPrice - widget.meal.price;
                            });
                          },
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              MealItemsCounter = MealItemsCounter + 1;
                              if (totalPrice == 0.0) totalPrice = widget.meal.price;
                              totalPrice = totalPrice + widget.meal.price;
                            });
                          },
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (Cart.restaurantName == widget.restaurantName || Cart.restaurantName == '') {
                        for (int i = 0; i < MealItemsCounter; i++) {
                          Cart.meals.add(widget.meal);
                        }
                        Cart.restaurantLogo = widget.restaurantLogo;
                        Cart.restaurantName = widget.restaurantName;
                        Cart.item = Cart.item + MealItemsCounter;
                        if (MealItemsCounter == 1) totalPrice = widget.meal.price;
                        Cart.total = Cart.total + totalPrice;
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        border: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Add to cart',
                              style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      widget.meal.pic,
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      widget.meal.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(text: 'from ', style: TextStyle(color: Colors.grey, fontSize: 16)),
                          TextSpan(
                              text: widget.restaurantName, style: const TextStyle(color: Colors.indigo, fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppStyle.spasingHight,
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
