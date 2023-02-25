import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/mealPage.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/Meal.dart';

class mealCard extends StatefulWidget {
  mealCard({
    Key? key,
    required this.meal,
    required this.resturantName,
    required this.restaurantLogo,
    required this.onDelete,
  }) : super(key: key);

  final Meal meal;
  String resturantName;
  String restaurantLogo;
  final Function() onDelete;

  @override
  State<mealCard> createState() => _mealCardState();
}

class _mealCardState extends State<mealCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealPage(
                          navBarIndex: 0,
                          meal: widget.meal,
                          restaurantName: widget.resturantName,
                          restaurantLogo: widget.restaurantLogo,
                        )));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: const Color.fromARGB(255, 222, 222, 222)),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.meal.name),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (Cart.restaurantName == widget.resturantName || Cart.restaurantName == '') {
                              Cart.meals.add(widget.meal);
                              Cart.item++;
                              Cart.restaurantName = widget.resturantName;
                              Cart.total = Cart.total + widget.meal.price;
                              Cart.restaurantLogo = widget.restaurantLogo;
                            }
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: const BorderRadius.all(Radius.circular(20))),
                            child: Text('SAR ${widget.meal.price}'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ],
                ),
                Image.network(
                  widget.meal.pic,
                  width: 80,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
