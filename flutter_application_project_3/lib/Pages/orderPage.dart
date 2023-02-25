import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/Meal.dart';
import 'package:flutter_application_project_3/moduls/OrderC.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPage();
}

class _OrderPage extends State<OrderPage> {
  late Widget page;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!OrderC.thereIsOrder) {
      page = Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Orders'),
              Text('History'),
            ],
          ),
        ),
        body: const Center(
            child: Text(
          'There is no Order',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
        )),
      );
    } else {
      page = Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Orders'),
              Text('History'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: OrderCard(),
          ),
        ),
      );
    }
    return page;
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: const Color.fromARGB(255, 216, 216, 216)),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delivery',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Cart.restaurantName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    Cart.restaurantLogo,
                    width: 70,
                  ),
                ],
              ),
              for (final meal in Cart.meals)
                OrderItem(
                  meal: meal,
                ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Row(
                children: [
                  Text('Order Total SAR ${Cart.total}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderItem extends StatefulWidget {
  const OrderItem({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meal meal;
  @override
  State<OrderItem> createState() => _OrderItem();
}

class _OrderItem extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.meal.name,
          style: const TextStyle(color: Colors.black),
        ),
        Image.network(
          widget.meal.pic,
          width: 90,
        ),
      ],
    );
  }
}
