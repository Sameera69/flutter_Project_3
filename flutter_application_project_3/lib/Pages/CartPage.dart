import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/Checkout.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/Meal.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _Cart();
}

class _Cart extends State<CartPage> {
  late Widget page;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Cart.item == 0) {
      Cart.restaurantName = '';
      page = Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                children: const [
                  Text('Cart'),
                ],
              ),
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Deliver to ', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        TextSpan(text: 'Selected location', style: TextStyle(color: Colors.indigo, fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: const Center(
            child: Text(
          'Cart is Empty',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
        )),
      );
    } else {
      page = Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                children: const [
                  Text('Cart'),
                ],
              ),
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Deliver to ', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        TextSpan(text: 'Selected location', style: TextStyle(color: Colors.indigo, fontSize: 16)),
                      ],
                    ),
                  ),
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
                children: [
                  const Text('Total'),
                  Text(
                    'SAR ${Cart.total}.00',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: AppStyle.spasingHight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Checkout()));
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
                          child: Text('Deliver to me',
                              style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border.fromBorderSide(BorderSide(color: Colors.blue)),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Deliver to friend',
                              style: TextStyle(color: Colors.blue, fontSize: AppStyle.bottonTextSize)),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Cart (${Cart.item} items)',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: const Color.fromARGB(255, 216, 216, 216)),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Image.network(
                        Cart.restaurantLogo,
                        width: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Cart.restaurantName,
                          ),
                          Text(
                            '${Cart.item} items',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                for (final meal in Cart.meals)
                  CartItem(
                    meal: meal,
                    onDelete: () {
                      setState(() {});
                    },
                  ),
              ],
            ),
          ),
        ),
      );
    }
    return page;
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.meal,
    required this.onDelete,
  }) : super(key: key);
  final Meal meal;
  final Function() onDelete;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: const Color.fromARGB(255, 216, 216, 216)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                widget.meal.pic,
                width: 90,
              ),
              Text(
                widget.meal.name,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text(
                'Edit options',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 205, 205, 205),
                          border: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('-    1    +',
                                style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Cart.item--;
                              Cart.total = Cart.total - widget.meal.price;
                              Cart.meals.remove(widget.meal);
                              widget.onDelete();
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
                              Cart.item++;
                              Cart.total = Cart.total + widget.meal.price;
                              Cart.meals.add(widget.meal);
                              widget.onDelete();
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
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Cart.item--;
                        Cart.total = Cart.total - widget.meal.price;
                        Cart.meals.remove(widget.meal);
                        widget.onDelete();
                      });
                    },
                    child: const Text(
                      'Remove',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Text(
                'SAR ${widget.meal.price}.00',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
